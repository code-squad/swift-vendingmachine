//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by CHOMINJI on 17/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class VendingMachine {
    private(set) var balance = 0
    var stock: [Beverage: Int] = [:]
    
    /// 자판기 금액을 원하는 금액만큼 올린다.
    func putMoney(amount money: Int) {
    }
    
    ///특정 상품 인스턴스를 넘겨서 재고를 추가한다.
    func addStock(of beverage: Beverage) {
    }
    
    /// 현재 금액으로 구매 가능한 음료수 목록을 리턴한다.
    func fetchPurchaseableList() {

    }
    
    /// 음료수를 구매한다.
    func purchase(beverage: Beverage) -> Beverage? {
       
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
