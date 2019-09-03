//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by CHOMINJI on 17/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class VendingMachine {
    private var balance = 0
    private var storage: Storage
    private var purchaseHistory: [Beverage] = []
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    /// 자판기 금액을 원하는 금액만큼 올린다.
    func insertMoney(amount: Int) {
        balance += amount
    }
    
    ///특정 상품 인스턴스를 넘겨서 재고를 추가한다.
    func addStock(of beverage: Beverage, count: Int) {
        storage.append(beverage, count: count)
    }
    
    /// 음료수를 구매한다.
    func purchase(beverage: Beverage, completion: (String, Int) -> Void) -> Beverage? {
        let purchasableBeverages = fetchPurchasableBeverages()
        guard !purchasableBeverages.isEmpty else {
            return nil
        }
        storage.purchase(beverage)
        purchaseHistory.append(beverage)
        balance -= beverage.itemPrice
        completion(beverage.itemName, beverage.itemPrice)
        return beverage
    }
    
    func fetchBeverage(at index: Int) -> Beverage? {
        return storage.fetchBeverage(at: index)
    }
    
    /// 유통기한이 지난 재고만 리턴한다.
    func fetchExpiredStock() -> [Beverage] {
        return storage.filter(by: .expired)
    }

    /// 따뜻한 음료만 리턴한다.
    func fetchHotBeverages() -> [Beverage] {
        return storage.filter(by: .hot)
    }
    
    /// 현재 금액으로 구매 가능한 음료수 목록을 리턴한다.
    func fetchPurchasableBeverages() -> [Beverage] {
        return storage.filter(by: .purchasable(balance))
    }
    
    /// 시작이후 구매 상품 이력을 배열로 리턴한다.
    func fetchPurchaseHistory() -> [Beverage] {
        return purchaseHistory
    }
}

// MARK: - Show Methods

extension VendingMachine {
    /// 잔액을 보여준다.
    func showBalance(with show: (Int) -> Void) {
        show(balance)
    }
    
    /// 재고를 출력한다.
    func showInventory(with form: InventoryInfo) {
        storage.showAllList(with: form)
    }
}
