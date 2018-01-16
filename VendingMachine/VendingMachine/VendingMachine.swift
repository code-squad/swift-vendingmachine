//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    var coins: Int
    let inventoryBox: InventoryBox
    init() {
        self.coins = 0
        inventoryBox = InventoryBox()
    }
    
    // 자판기 금액을 원하는 금액만큼 올리는 메소드
    mutating func putCoins(coins: Int) {
        self.coins = coins
    }
    
    // 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    func addInInventory(beverage: Beverage) {
        inventoryBox.storageBeverageStock(beverage: beverage)
    }
    
    // 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
//    func listOfDrinksAvailable() -> [Beverage] {
//        
//    }
    
    // 음료수를 구매하는 메소드
    func buyBeverage() {
        
    }
    
    // 잔액을 확인하는 메소드
    func checkBalance () {
        
    }
    
    // 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func showEntireInventory() {
        
    }
    
    // 유통기한이 지난 재고만 리턴하는 메소드
//    func showOutOfStockInventory() -> [Beverage] {
//
//    }
    
    // 따뜻한 음료만 리턴하는 메소드
//    func showHotDrinks() -> [Beverage] {
//
//    }
    
    // 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func showPurchaseProductHistory() {
        
    }
    
    
}
