//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 17..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

typealias VendingMachineMode = VendingMachine.Mode
typealias Count = Int
typealias Price = Int

struct VendingMachine {
    private var inventory: [Drink : Count]
    private var purchases: [Drink : Count]
    private var inputMoney: Price
    private var income: Price
    // 인덱스로 음료수를 추가하기 위해 자판기의 음료 목록 초기화
    init(drinkList : [Drink]) {
        inventory = [Drink : Count]()
        purchases = [Drink : Count]()
        inputMoney = 0
        income = 0
        drinkList.forEach { drink in
            inventory[drink] = 0
        }
    }
}

extension VendingMachine: ManagerMode {

    // 특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    @discardableResult mutating func add(product: Drink) -> Int {
        guard let count = inventory[product] else {
            return 0
        }
        inventory[product] = count + 1
        return count + 1
    }
    
    // 음료수 인덱스를 넘겨서 재고를 추가하는 메소드
    @discardableResult mutating func add(productIndex: Int) throws -> Int {
        let listOfDrink = Array(listOfInventory().keys)
        guard productIndex >= 1 && productIndex <= listOfDrink.count else {
            throw stockError.invalidProductNumber
        }
        return add(product: listOfDrink[productIndex-1])
    }
    
    @discardableResult mutating func delete(product: Drink) -> Drink? {
        guard let count = inventory[product],
            count > 0 else {
            return nil
        }
        inventory[product] = count - 1
        return product
    }
    
    // 음료수 인덱스를 넘겨서 재고의 음료수를 삭제하는 메소드
    @discardableResult mutating func delete(productIndex: Int) throws -> Drink? {
        let listOfDrink = Array(listOfInventory().keys)
        guard productIndex >= 1 && productIndex <= listOfDrink.count else {
            throw stockError.invalidProductNumber
        }
        return delete(product: listOfDrink[productIndex-1])
    }
    
    func howMuchIncome() -> Price {
        return income
    }
    
    // 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func listOfInventory() -> [Drink : Count] {
        return inventory
    }

    // 유통기한이 지난 재고만 리턴하는 메소드
    func listOfOverExpirationDate() -> [Drink] {
        return inventory.keys.filter { drink in
            return !drink.valid(with: Date())
        }
    }

}

extension VendingMachine: UserMode {
    
    // 자판기 금액을 원하는 금액만큼 올리는 메소드
    mutating func add(money: Int) {
        inputMoney = money
    }
    
    // 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func listOfCanBuy() -> [Drink : Int] {
        let listOfCanBuy = inventory.filter { inventory in
            return inventory.key.price <= inputMoney
        }
        return listOfCanBuy
    }

    // 음료수를 구매하는 메소드
    @discardableResult mutating func buy(product: Drink) -> Drink? {
        // 해당 제품이 처음부터 없었던 제품이거나 (nil) 품절된 제품일 때
        guard let countOfProductInInventory = inventory[product],
            countOfProductInInventory > 0 else {
                return nil
        }
        self.inventory[product] = countOfProductInInventory - 1
        inputMoney -= product.price
        income += product.price
        guard let countOfProductInListOfPurchase = purchases[product] else {
            purchases[product] = 1
            return product
        }
        purchases[product] = countOfProductInListOfPurchase + 1
        return product
    }

    @discardableResult mutating func buy(productIndex: Int) throws -> Drink {
        let listOfDrink = Array(listOfCanBuy().keys)
        guard productIndex >= 1 && productIndex <= listOfDrink.count else {
            throw stockError.invalidProductNumber
        }
        guard let buyProduct = buy(product: listOfDrink[productIndex-1]) else {
            throw stockError.soldOut
        }
        return buyProduct
    }

    // 잔액을 확인하는 메소드
    func howMuchRemainMoney() -> Price {
        return inputMoney
    }

    // 따뜻한 음료만 리턴하는 메소드
    func listOfHotDrink() -> [Drink] {
        return inventory.keys.filter { drink in
            guard let coffee = drink as? Coffee else {
                return false
            }
            return coffee.isHot
        }
    }

    // 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func listOfPurchase() -> Array<(key: Drink, value: Count)> {
        let sortedListOfPurchase = purchases.sorted(by: < )
        return sortedListOfPurchase
    }

    mutating func extractAllMoney() -> Int {
        let change = inputMoney
        inputMoney = 0
        return change
    }

}

extension VendingMachine {
    enum stockError: String, Error {
        case soldOut = "해당 음료수는 품절되었습니다."
        case invalidProductNumber = "유효하지 않은 음료수 번호 입니다."
    }
    enum Mode: Int {
        case manager = 1
        case user = 2
    }
    enum ModeError: String, Error {
        case invalidNumber = "유효하지 않은 모드입니다."
    }

}
