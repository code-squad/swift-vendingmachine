//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 17..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    typealias Count = (original: Int, buy: Int)
    typealias Price = Int
    var inventory: [Drink : Count]
    var money: Int
    init(products: [Drink : Int]) {
        self.inventory = [Drink : Count]()
        money = 0
        products.forEach { products in
            self.inventory[products.key] = (products.value, 0)
        }
    }
    // 자판기 금액을 원하는 금액만큼 올리는 메소드
    mutating func add(money: Int) {
        self.money += money
    }
    // 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    mutating func add(product: Drink) {
        guard let numberOfProduct = inventory[product] else {
            inventory[product] = (0,0)
            return
        }
        inventory[product] = (numberOfProduct.original + 1, numberOfProduct.buy)
    }
    // 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func listOfCanBuy() -> [Drink] {
        return inventory.keys.filter{ drink in
            return drink.price < self.money
        }
    }
    // 음료수를 구매하는 메소드
    mutating func buy(product: Drink) -> Price? {
        guard let buyedProduct = inventory[product] else {
            return nil
        }
        inventory[product] = (buyedProduct.original, buyedProduct.buy + 1)
        return product.price
    }
    // 잔액을 확인하는 메소드
    func howMuchRemainMoney() -> Int {
        return money
    }
    // 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    
    // 유통기한이 지난 재고만 리턴하는 메소드
    func listOfOverExpirationDate() -> [Drink] {
        return inventory.keys.filter{ drink in
            if let expirationDate = drink.expirationDate {
                return expirationDate < Date()
            }
            return false
        }
    }
    // 따뜻한 음료만 리턴하는 메소드
    func listOfHotDrink() -> [Drink] {
        return inventory.keys.filter{ drink in
            guard let coffee = drink as? Coffee else {
                return false
            }
            return coffee.isHot
        }
    }
    // 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func listOfBuyedProduct() -> [Drink] {
        var listOfBuyedProduct = [Drink]()
        inventory.forEach { inventory in
            if inventory.value.buy != 0 {
                listOfBuyedProduct.append(inventory.key)
            }
        }
        return listOfBuyedProduct
    }
}
