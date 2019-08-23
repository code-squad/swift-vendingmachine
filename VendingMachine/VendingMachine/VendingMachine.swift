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
    var inventory = Inventory()
    var purchaseList: [Beverage] = []
    
    func showBalance(with completion: (Int) -> Void) {
        completion(balance)
    }
    
    /// 재고를 출력한다.
    func printStock() {
        inventory.showStock(with: OutputView.beverageListForm)
    }
    
    /// 자판기 금액을 원하는 금액만큼 올린다.
    func insertMoney(amount: Int) {
        balance += amount
    }
    
    ///특정 상품 인스턴스를 넘겨서 재고를 추가한다.
    func addStock(of beverage: Beverage, count: Int) {
        inventory.append(beverage, count: count)
    }
    
    /// 현재 금액으로 구매 가능한 음료수 목록을 리턴한다.
    func fetchPurchaseableList() -> [String] {
        return inventory.fetchPurchaseableList(with: balance)
    }
    
    /// 음료수를 구매한다.
    func purchase(beverage: Beverage) -> Beverage? {
        if inventory.canPurchaseBeverage(beverage, with: balance) {
            inventory.purchase(beverage)
            purchaseList.append(beverage)
            balance -= beverage.price
            return beverage
        }
        return nil
    }
    
    /// 잔액을 확인한다.
    func checkBalance() -> Int {
        return balance
    }
    
    /// 전체 상품 재고를 종류별로 리턴한다.
    func fetchCategorizedStock() -> Inventory {
        return inventory
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
        return purchaseList
    }
}
