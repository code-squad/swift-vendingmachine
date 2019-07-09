//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by jang gukjin on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    private var money: Int = 0
    private var items = [Product]()
    
    /// Product 타입의 배열을 중복제거 하고 싶을 때 사용하는 함수
    func set(of items: [Product]) -> [Product] {
        var itemsSet = [Product]()
        for item in items {
            if !itemsSet.contains(item) {
                itemsSet.append(item)
            }
        }
        return itemsSet
    }
    
    /// 자판기 금액을 원하는 금액만큼 올리는 메소드
    mutating func pay(of addedMoney: Int) {
        money += addedMoney
    }
    
    /// 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    mutating func stockUp(of item: Product) {
        items.append(item)
    }
    
    /// 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func displayItems() -> [Product] {
        var buyableItems = [Product]()
        let itemsSet = set(of: items)
        for item in itemsSet {
            let price = item.getPrice()
            if price < money {
                buyableItems.append(item)
            }
        }
        return buyableItems
    }
    
    /// 음료수를 구매하는 메소드
    func purchase() {
        
    }
    
    /// 잔액을 확인하는 메소드
    mutating func checkBalance() -> Int {
        return money
    }
    
    /// 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func isFullStock(){
    
    }
    
    /// 유통기한이 지난 재고만 리턴하는 메소드
    func isItemsPastExpirationDate() {
        
    }
    
    /// 따뜻한 음료만 리턴하는 메소드
    func isHotBeverage() {
        
    }
    
    /// 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func isPurchaseDetails() {
        
    }
}
