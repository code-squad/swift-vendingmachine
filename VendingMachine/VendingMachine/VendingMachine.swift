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
typealias Inventory = Dictionary<Category, Products>

class VendingMachine: CustomStringConvertible {
    fileprivate var coins: Int
    fileprivate var inventory: Inventory
    fileprivate var salesHistory: Products = []

    enum Mode {
        case admin
        case user
        case none
    }

    init() {
        coins = 0
        inventory = [:]
    }

    init(coins: Int, inventory: Inventory) {
        self.coins = coins
        self.inventory = inventory
    }

    var description: String {
        return "coins: \(String(coins))원, inventory: \(String(describing: inventory))"
    }

    func getMode(input: String) -> Mode {
        if input == "1" {
            return Mode.admin
        } else if input == "2" {
            return Mode.user
        } else {
            return Mode.none
        }
    }

}

struct VendingMachineAdmin {
    private var vendingMachine: VendingMachine

    init(vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }

    //    특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    func add(product: Beverage) {
        let category: Category = String(product.description.split(separator: "(")[0])
        if vendingMachine.inventory[category] != nil {
            vendingMachine.inventory[category]!.append(product)
        } else {
            vendingMachine.inventory[category] = [product]
        }
    }

    //    유통기한이 지난 재고만 리턴하는 메소드
    func getExpiredProducts(date: Date) -> Products {
        var result: Products = []
        vendingMachine.inventory.filter({ $0.key.hasSuffix("우유") }).forEach({
            _, value in
            result.append(contentsOf: value.flatMap({ $0 as? Milk })
                                           .filter({ !$0.validate(with: date) })
                                           .map({ $0 as Beverage }))
        })
        print("check::: \(result)")
        return result
    }

    //    시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func getSalesHistory() -> Products {
        return vendingMachine.salesHistory
    }

    //    전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func getInventory() -> Inventory {
        return vendingMachine.inventory.filter { $0.value.count > 0 }
    }

    //    특정 상품 인스턴스를 넘겨서 재고를 제거하는 메소드
    func remove(product: Beverage) {
        let category: Category = String(product.description.split(separator: "(")[0])
        if vendingMachine.inventory[category] != nil {
            for i in 0..<vendingMachine.inventory[category]!.count where vendingMachine.inventory[category]![i] == product {
                vendingMachine.inventory[category]!.remove(at: i)
            }
        }
    }

}

struct VendingMachineUser {
    private var vendingMachine: VendingMachine
    private(set) var purchaseList: Products = []

    init(vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }

    //    자판기 금액을 원하는 금액만큼 올리는 메소드
    func insertCoins(_ amount: Int) {
        vendingMachine.coins += amount
    }

    //    현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func getBuyableProducts() -> Array<Category> {
        var result: Array<Category> = []
        for (key, value) in vendingMachine.inventory {
            let count = value.filter { $0.isBuyable(with: vendingMachine.coins) }.count
            if count > 0 {
                result.append(key)
            }
        }
        return result
    }

    //    음료수를 구매하는 메소드
    mutating func buy(category: Category) {
        if vendingMachine.inventory[category] != nil {
            vendingMachine.salesHistory.append(vendingMachine.inventory[category]!.removeFirst())
            vendingMachine.coins -= vendingMachine.salesHistory.last!.price
            purchaseList.append(vendingMachine.salesHistory.last!)
        }
    }

    //    잔액을 확인하는 메소드
    func getBalance() -> Int {
        return vendingMachine.coins
    }

    //    전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func getInventory() -> Inventory {
        return vendingMachine.inventory.filter { $0.value.count > 0 }
    }

    //    따뜻한 음료만 리턴하는 메소드
    func getHotProducts() -> Products {
        var result: Products = []
        vendingMachine.inventory.filter { $0.key.hasSuffix("커피") }.forEach({ _, value in
            result.append(contentsOf: value.flatMap { $0 as? Coffee }
                .filter { $0.isHot() }
                .map { $0 as Beverage })
        })
        return result
    }

}
