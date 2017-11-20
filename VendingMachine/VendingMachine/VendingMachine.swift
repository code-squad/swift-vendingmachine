//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 17..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

typealias DrinkName = String
typealias Count = Int
typealias Price = Int

struct VendingMachine {
    private var inventory: [Drink : Count]
    private var purchases: [DrinkName : Count]
    private var money: Price
    init() {
        inventory = [Drink : Count]()
        purchases = [DrinkName : Count]()
        money = 0
    }
}

extension VendingMachine {
    // 자판기 금액을 원하는 금액만큼 올리는 메소드
    mutating func add(money: Int) {
        self.money += money
    }
    // 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    @discardableResult mutating func add(product: Drink) -> Int {
        guard let count = inventory[product] else {
            inventory[product] = 1
            return 1
        }
        inventory[product] = count + 1
        return count + 1
    }

    // 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func listOfCanBuy() -> Array<(key: Drink, value: Count)> {
        let listOfCanBuy = inventory.filter{ inventory in
            return inventory.key.price <= self.money
        }
        return listOfCanBuy.sorted(by: < )
    }

    // 음료수를 구매하는 메소드
    @discardableResult mutating func buy(product: Drink) -> Drink? {
        // 해당 제품이 처음부터 없었던 제품이거나 (nil) 품절된 제품일 때
        guard let countOfProductInInventory = inventory[product],
            countOfProductInInventory != 0 else {
                return nil
        }
        self.inventory[product] = countOfProductInInventory - 1
        self.money -= product.price
        guard let countOfProductInListOfPurchase = purchases[product.typeOfProduct] else {
            purchases[product.typeOfProduct] = 1
            return product
        }
        purchases[product.typeOfProduct] = countOfProductInListOfPurchase + 1
        return product
    }

    @discardableResult mutating func buy(productIndex: Int) throws -> Drink {
        let listOfCanBuy = self.listOfCanBuy()
        if productIndex < 1 || productIndex > listOfCanBuy.count {
            throw stockError.invalidProductNumber
        }
        guard let buyProduct = buy(product: listOfCanBuy[productIndex-1].key) else {
            throw stockError.soldOut
        }
        return buyProduct
    }

    // 잔액을 확인하는 메소드
    func howMuchRemainMoney() -> Price {
        return money
    }

    // 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func listOfInventory() -> Array<(key: Drink, value: Count)> {
        let sortedInventory = inventory.sorted(by: < )
        return sortedInventory
    }

    // 유통기한이 지난 재고만 리턴하는 메소드
    func listOfOverExpirationDate() -> [Drink] {
        return inventory.keys.filter{ drink in
            return !drink.valid(with: Date())
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
    func listOfPurchase() -> Array<(key: DrinkName, value: Count)> {
        let sortedListOfPurchase = purchases.sorted(by: < )
        return sortedListOfPurchase
    }

}

extension VendingMachine {
    subscript(drink: Drink) -> Count? {
        guard let drinkValue = inventory[drink] else {
            return nil
        }
        return drinkValue
    }

    subscript(drinkName: String) -> Count? {
        guard let count = purchases[drinkName] else {
            return nil
        }
        return count
    }

}

extension VendingMachine {
    enum stockError: String, Error {
        case soldOut = "해당 음료수는 품절되었습니다."
        case invalidProductNumber = "유효하지 않은 음료수 번호 입니다."
    }
}

