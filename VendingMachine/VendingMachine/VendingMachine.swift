//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by jang gukjin on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

extension Array where Element == Product {
    /// 파라미터로 받은 원소가 해당 배열에 몇개 있는지 카운트하는 함수
    func countElement(of element: Product) -> Int{
        var score:Int = 0
        for part in self {
            if part == element {
                score += 1
            }
        }
        return score
    }
}

struct VendingMachine {
    private var money: Int = 0
    private var items = [Product]()
    private var purchaseDetails = [Product]()
    
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
    
    /// 해당 아이템 가격보다 가진 돈이 많은지 확인하는 메소드
    func distinctBuyable(of item: Product) -> Bool {
        return item.getPrice() < money
    }
    
    /// 자판기 금액을 원하는 금액만큼 올리는 메소드
    mutating func pay(of addedMoney: Int) {
        money += addedMoney
    }
    
    /// 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    mutating func stockUp(of item: Product, count: Int) {
        for _ in 0..<count {
            items.append(item)
        }
    }
    
    /// 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func displayItems() -> [Product] {
        var buyableItems = [Product]()
        let itemsSet = set(of: items)
        for item in itemsSet {
            if distinctBuyable(of: item) {
                buyableItems.append(item)
            }
        }
        return buyableItems
    }
    
    /// 음료수를 구매하는 메소드
    mutating func purchase(of item: Product) {
        let price = item.getPrice()
        money -= price
        var index = 0
        while true {
            if items[index] == item {
                items.remove(at: index)
                purchaseDetails.append(item)
                break
            }
            index += 1
        }
    }
    
    /// 잔액을 확인하는 메소드
    mutating func checkBalance() -> Int {
        return money
    }
    
    /// 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func isFullStock() -> [Product:Int] {
        var dictionaryTypeItems = [Product:Int]()
        for item in set(of: items) {
            dictionaryTypeItems[item] = items.countElement(of: item)
        }
        return dictionaryTypeItems
    }
    
    /// 유통기한이 지난 재고만 리턴하는 메소드
    func isItemsPastExpirationDate() -> [Product]{
        var pastedDateitems = [Product]()
        let itemsSet = set(of: items)
        for item in itemsSet {
            if !item.validate() {
                pastedDateitems.append(item)
            }
        }
        return pastedDateitems
    }
    
    /// 따뜻한 음료만 리턴하는 메소드
    func isHotBeverage() -> [Product]{
        var hotDrinkitems = [Product]()
        let itemsSet = set(of: items)
        for item in itemsSet {
            if let coffee: Coffee = item as? Coffee, coffee.isHot() {
                hotDrinkitems.append(item)
            }
        }
        return hotDrinkitems
    }
    
    /// 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func isPurchaseDetails() -> [Product] {
        return purchaseDetails
    }
}
