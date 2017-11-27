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

class VendingMachine {
    private var inventory: [Drink]
    private var purchases: [Drink]
    private var inputMoney: Price
    private var income: Price
    private var menu: Menu

    init() {
        inventory = [Drink]()
        purchases = [Drink]()
        menu = Menu()
        inputMoney = 0
        income = 0
    }

}

extension VendingMachine: ManagerModeDelegate {

    // 음료수 인덱스를 넘겨서 재고를 추가하는 메소드
    func add(productIndex: Int) throws {
        let listOfDrink = AllDrinkList()
        guard productIndex >= 1 && productIndex <= listOfDrink.count else {
            throw stockError.invalidProductNumber
        }
        inventory.append(listOfDrink[productIndex-1])
    }

    // 음료수 인덱스를 넘겨서 재고의 음료수를 삭제하는 메소드
    @discardableResult func delete(productIndex: Int) throws -> Drink {
        let listOfDrink = AllDrinkList()
        guard productIndex >= 1 && productIndex <= listOfDrink.count else {
            throw stockError.invalidProductNumber
        }
        let deleteDrink = listOfDrink[productIndex - 1]
        for drink in inventory.enumerated() {
            if drink.element === deleteDrink  {
                inventory.remove(at: drink.offset)
                return drink.element
            }
        }
        throw stockError.empty
    }

    func howMuchIncome() -> Price {
        return income
    }

    // 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func listOfInventory() -> [Drink : Count] {
        var countDictionary = [Drink : Count]()
        for drink in inventory {
            let count = countDictionary[drink] ?? 0
            countDictionary[drink] = count + 1
        }
        return countDictionary
    }

    // 유통기한이 지난 재고만 리턴하는 메소드
    func listOfOverExpirationDate() -> [Drink] {
        return inventory.filter { drink in
            return !drink.valid(with: Date())
        }
    }

    func AllDrinkList() -> [Drink] {
        return menu.drinkList
    }

}

extension VendingMachine: UserModeDelegate {

    // 자판기 금액을 원하는 금액만큼 올리는 메소드
    func add(money: Int) {
        inputMoney = money
    }

    // 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func listOfCanBuy() -> [Drink] {
        let listOfCanBuy = inventory.filter { inventory in
            return inventory.price <= inputMoney
        }
        return listOfCanBuy
    }

    @discardableResult func buy(productIndex: Int) throws -> Drink {
        let listOfDrink = listOfCanBuy()
        guard productIndex >= 1 && productIndex <= listOfDrink.count else {
            throw stockError.invalidProductNumber
        }
        let buyDrink = listOfDrink[productIndex-1]
        for drink in inventory.enumerated() {
            if drink.element == buyDrink {
                let selectDrink = drink.element
                inputMoney -= selectDrink.price
                income += selectDrink.price
                inventory.remove(at: drink.offset)
                purchases.append(selectDrink)
                return selectDrink
            }
        }
        throw stockError.soldOut
    }

    // 잔액을 확인하는 메소드
    func howMuchRemainMoney() -> Price {
        return inputMoney
    }

    // 따뜻한 음료만 리턴하는 메소드
    func listOfHotDrink() -> [Drink] {
        return inventory.filter { drink in
            guard let coffee = drink as? Coffee else {
                return false
            }
            return coffee.isHot
        }
    }

    // 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func listOfPurchase() -> [Drink] {
        return purchases
    }

    func extractAllMoney() -> Int {
        let change = inputMoney
        inputMoney = 0
        return change
    }

}

extension VendingMachine {
    enum stockError: String, Error {
        case soldOut = "해당 음료수는 품절되었습니다."
        case invalidProductNumber = "유효하지 않은 음료수 번호 입니다."
        case empty = "재고가 하나도 없습니다."
    }
    enum Mode: Int {
        case manager = 1
        case user = 2
    }
    enum ModeError: String, Error {
        case invalidNumber = "유효하지 않은 모드입니다."
    }
    enum OptionError: String, Error {
        case invalidNumber = "유효하지 않은 명령입니다."
    }

}

struct Menu {
    var drinkList: [Drink]

    init() {
        let strawBerryMilk = StrawBerryMilk(brand: "서울우유",
                                            weight: "200ml",
                                            price: "1000원",
                                            name: "날마다딸기우유",
                                            dateOfManufacture: "20171009",
                                            calorie: "300kcal",
                                            ingredients: ["strawBerrySyrup"],
                                            ratioOfStrawBerrySyrup: "3.2%")
        let bananaMilk = BananaMilk(brand: "서울우유",
                                    weight: "200ml",
                                    price: "1000원",
                                    name: "날마다딸기우유",
                                    dateOfManufacture: "20171012",
                                    calorie: "350kcal",
                                    ingredients: ["bananaSyrup"],
                                    ratioOfBananaSyrup: "2.5%")
        let coke = Coke(calorie: "200kcal",
                        brand: "팹시",
                        weight: "350ml",
                        price: "2000원",
                        name: "다이어트콜라",
                        dateOfManufacture: "20171005",
                        amountOfSugar: "50g")
        let coffee = Coffee(calorie: "150kcal",
                            brand: "맥심",
                            weight: "400ml",
                            price: "3000원",
                            name: "TOP아메리카노",
                            dateOfManufacture: "20171010",
                            isHot: true,
                            amountOfCaffeine: "30mg",
                            nameOfCoffeeBeans: "Colombia")
        drinkList = [ strawBerryMilk!, bananaMilk!, coke!, coffee!]
    }



}

