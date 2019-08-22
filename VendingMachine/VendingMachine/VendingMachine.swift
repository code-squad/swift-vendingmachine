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
    var stock: [Beverage: Int] = [:]
    
    func showBalance(with completion: (Int) -> Void) {
        completion(balance)
    }
    
    func showStock(with completion: ([(name: String, price: Int, value: Int)]) -> Void) {
        let names = stock.map { ($0.key.name, $0.key.price, $0.value) }
        completion(names)
    }
    
    /// 자판기 금액을 원하는 금액만큼 올린다.
    func insertMoney(amount: Int) {
        balance += amount
    }
    
    ///특정 상품 인스턴스를 넘겨서 재고를 추가한다.
    func addStock(of beverage: Beverage, count: Int) {
        stock[beverage, default: 0] += count
    }
    
    /// 현재 금액으로 구매 가능한 음료수 목록을 리턴한다.
    func fetchPurchaseableList() -> [String] {
        let beveragePrices = stock.keys
            .filter { $0.price <= balance }
            .map { $0.name }
        return beveragePrices
    }
    
    /// 음료수를 구매한다.
    func purchase(beverage: Beverage) -> Beverage? {
        if stock[beverage] != nil {
            stock[beverage]! -= 1
            return beverage
        }
        return nil
    }
    
    /// 잔액을 확인한다.
    func checkBalance() -> Int {
        return balance
    }
    
    /// 전체 상품 재고를 종류별로 리턴한다.
    func fetchCategorizedStock() {
        
    }
    
    /// 유통기한이 지난 재고만 리턴한다.
    func fetchExpiredStock() {
        
    }
    
    /// 따뜻한 음료만 리턴한다.
    func fetchHotBeverages() {
        
    }
    
    /// 시작이후 구매 상품 이력을 배열로 리턴한다.
    func fetchPurchaseHistory() {
        
    }
}
