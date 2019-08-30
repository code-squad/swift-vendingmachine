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
    private var inventory: Inventory
    private var purchaseHistory: [Beverage] = []
    
    init(inventory: Inventory) {
        self.inventory = inventory
    }
    
    /// 자판기 금액을 원하는 금액만큼 올린다.
    func insertMoney(amount: Int) {
        balance += amount
    }
    
    ///특정 상품 인스턴스를 넘겨서 재고를 추가한다.
    func addStock(of beverage: Beverage, count: Int) {
        inventory.append(beverage, count: count)
    }
    
    /// 음료수를 구매한다.
    func purchase(beverage: Beverage) -> Beverage? {
        if inventory.canPurchaseBeverage(beverage, with: balance) {
            inventory.purchase(beverage)
            purchaseHistory.append(beverage)
            balance -= beverage.itemPrice
            return beverage
        }
        return nil
    }
    
    /// 유통기한이 지난 재고만 리턴한다.
    func fetchExpiredStock() -> [Beverage] {
        return inventory.filter(by: .expired)
    }
    
    /// 따뜻한 음료만 리턴한다.
    func fetchHotBeverages() -> [Beverage] {
        return inventory.filter(by: .hot)
    }
    
    /// 시작이후 구매 상품 이력을 배열로 리턴한다.
    func fetchPurchaseHistory() -> [Beverage] {
        return purchaseHistory
    }
}

// MARK: - Show, Print Methods
extension VendingMachine {
    /// 잔액을 보여준다.
    func showBalance(with show: (Int) -> Void) {
        show(balance)
    }
    
    /// 재고를 출력한다.
    func showInventory(with form: InventoryInfo) {
        inventory.showAllList(with: form)
    }
    
    /// 현재 금액으로 구매 가능한 음료수 목록을 출력한다.
    func showPurchasableList(with form: InventoryInfo) {
        inventory.showPurchasableList(money: balance, with: form)
    }
}
