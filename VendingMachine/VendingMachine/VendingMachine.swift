//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 11..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

typealias Products = Array<Beverage>
typealias Category = String

struct VendingMachine {
    private var coins: Int = 0
    private var inventory: Dictionary<Category, Products> = [:]
    private var salesHistory: Products = []

    //    자판기 금액을 원하는 금액만큼 올리는 메소드
    mutating func insertCoins(_ amount: Int) {
        coins += amount
    }

    //    특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    mutating func addProduct(category: Category, product: Beverage) {
        if inventory[category] != nil {
            inventory[category]!.append(product)
        } else {
            inventory[category] = []
            inventory[category]!.append(product)
        }
    }

    //    현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func getBuyableProducts() -> Products {
        var result: Products = []
        for (_, value) in inventory {
            result.append(contentsOf: value.filter { $0.isBuyable(with: coins) })
        }
        return result
    }

    //    음료수를 구매하는 메소드
    mutating func buy(category: Category) {
        if inventory[category] != nil {
            salesHistory.append(inventory[category]!.removeFirst())
            coins -= Int(salesHistory.last!.description
                        .split(separator: ",").filter { $0.hasSuffix("원") }[0]
                        .trimmingCharacters(in: .whitespaces)
                        .split(separator: "원")[0])!
        }
    }

    //    잔액을 확인하는 메소드
    func getBalance() -> Int {
        return coins
    }

    //    전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func getInventory() -> Dictionary<Category, Products> {
        return inventory.filter { $0.value.count > 0 }
    }

    //    유통기한이 지난 재고만 리턴하는 메소드
    func getExpiredProducts(date: Date) -> Products {
        var result: Products = []
        let milkInventory = inventory.filter { $0.key.hasSuffix("우유") }
        for (_, value) in milkInventory {
            let milkProducts: Array<Milk> = value.map { $0 as! Milk }
            result.append(contentsOf: milkProducts
                                        .filter { !$0.validate(with: date) }
                                        .map { $0 as Beverage })
        }
        return result
    }

    //    따뜻한 음료만 리턴하는 메소드
    func getHotProducts() -> Products {
        var result: Products = []
        let coffeeInventory = inventory.filter { $0.key.hasSuffix("커피") }
        for (_, value) in coffeeInventory {
            let coffeeProducts: Array<Coffee> = value.map { $0 as! Coffee }
            result.append(contentsOf: coffeeProducts
                                        .filter { $0.isHot() }
                                        .map { $0 as Beverage })
        }
        return result
    }

    //    시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func getSalesHistory() -> Products {
        return salesHistory
    }

}
