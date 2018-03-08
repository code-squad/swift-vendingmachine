//
//  UnitTestVendingMachine.swift
//  UnitTestVendingMachine
//
//  Created by YOUTH on 2018. 1. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {


    func testAttribute() {
        let strawberryMilk = Milk(flavor: "딸기", brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactured: "20171009")

        let result = strawberryMilk.isDecaf()
        XCTAssertEqual(result, true)
    }

    func testAddDate_DAY() {
        let date1 = Date(yyyyMMdd: "20171110")
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: date1)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let result = tomorrow ?? Date()
        let dateString = formatter.string(from: result)

        XCTAssertEqual(dateString, "20171111")
    }

    func testAddDate_MONTH() {
        let date1 = Date(yyyyMMdd: "20171110")
        let tomorrow = Calendar.current.date(byAdding: .month, value: 3, to: date1)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let result = tomorrow ?? Date()
        let dateString = formatter.string(from: result)

        XCTAssertEqual(dateString, "20180210")
    }

    func testAddDate_YEAR() {
        let date1 = Date(yyyyMMdd: "20171110")
        let tomorrow = Calendar.current.date(byAdding: .year, value: 2, to: date1)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let result = tomorrow ?? Date()
        let dateString = formatter.string(from: result)

        print(">>>> Add One Date <<<< : \(dateString)")
        XCTAssertEqual(dateString, "20191110")
    }

    func testExpiration_STRAWBERRYMILK() {
        let strawberryMilk = Milk(flavor: "딸기", brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactured: "20171009")

        XCTAssertEqual(false, strawberryMilk.isValid())
    }

    func testExpiration_BANANAMILK() {
        let bananaMilk = Milk(flavor: "바나나", brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20180131")
        XCTAssertEqual(false, bananaMilk.isValid())
    }

    func testExpiration_COKE() {
        let coke = SoftDrink(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", manufactured: "20171005")
        XCTAssertEqual(true, coke.isValid())
    }

    func testExpiration_COFFEE() {
        let coffee = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20180111")
        XCTAssertEqual(true, coffee.isValid())
    }

    func testExtensionDate_init() {
        let customDate = Date(yyyyMMdd: "20181127")
        print(customDate.description)
    }

    func testDate_OutofDate() {
        let customDate = Date(yyyyMMdd: "20180101")
        let result = customDate.isOutOfDate(validDuration: 7)
        XCTAssertEqual(false, result)
    }

    func testPrintStock() {
        var stock = [Beverage]()
        let chocoMilk = ChocoMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다초코우유", manufactured: "20180128")
        let bananaMilk = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20180128")
        let coke = SoftDrink(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20171005")
        let dolceLatte = Coffee(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20171010")
        let energyDrink = EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20171010")

        for _ in 0..<5 {
            stock.append(chocoMilk)
            stock.append(bananaMilk)
            stock.append(coke)
            stock.append(dolceLatte)
            stock.append(energyDrink)
        }
        let vending = VendingMachine(stockItems:stock)
        print(vending.showStock())
        print(vending.stockContoller.stock)
    }

    func testHotBeverage() {
        var stock = [Beverage]()
        let chocoMilk = ChocoMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다초코우유", manufactured: "20180128")
        let bananaMilk = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20180128")
        let coke = SoftDrink(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20171005")
        let dolceLatte = DolceLatte(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20171010")
        let energyDrink = EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20171010")

        for _ in 0..<3 {
            stock.append(chocoMilk)
            stock.append(bananaMilk)
            stock.append(coke)
            stock.append(dolceLatte)
            stock.append(energyDrink)
        }
        let vendingMachine = VendingMachine(stockItems: stock)
        let displayHotItems = vendingMachine.hotBeverage()
        print(displayHotItems.description)

    }

    func testValidExpirateDate() {
        var stock = [Beverage]()
        let chocoMilk = ChocoMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다초코우유", manufactured: "20180203")
        let coke = SoftDrink(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20171005")
        let expiredCoffee = Coffee(brand: "폴바셋", weight: 350, price: 4000, name: "롱블랙", manufactured: "20171010")
        let dolceLatte = DolceLatte(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20180202")

        for _ in 0..<3 {
            stock.append(chocoMilk)
            stock.append(coke)
            stock.append(expiredCoffee)
            stock.append(dolceLatte)
        }
        // 추가된 음료를 딕셔너리형태로 정렬 (커피 수 : 6)
        let vendingMachine = VendingMachine(stockItems: stock)
        let exceptDiscard = vendingMachine.validItems()
        print(exceptDiscard.description)
        // 유통기한 지난 음료는 안나옴 (커피 수 - 폴바셋 표시 X : 3)
    }

    func testObjectIdentifier() {
        var stock = [Beverage]()
        let americano = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010")
        let dolceLatte = Coffee(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20171010")
        let energyDrink = EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20171010")

        for _ in 0..<2 {
            stock.append(americano)
            stock.append(dolceLatte)
            stock.append(energyDrink)
        }
        // 추가된 음료를 딕셔너리형태로 정렬
        let productSets = stock.reduce(into: [ObjectIdentifier:[ObjectIdentifier]]()) {
            $0[ObjectIdentifier(type(of:$1)), default:[]].append(ObjectIdentifier($1))
        }
        print(productSets)
        }

    func testAddItems() {
        var stock = [Beverage]()
        let americano = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010")
        let energyDrink = EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20171010")

        for _ in 0..<2 {
            stock.append(americano)
            stock.append(energyDrink)
        }
        let dolceLatte = DolceLatte(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20180110")

        let vending = VendingMachine(stockItems: stock)
        print(vending.showStock())
        vending.add(inputItem: dolceLatte)
        print(vending.showStock())
        //print(addedStock.description)

    }

    func testCheckMoneyInput() {
        let testInput = 2
        let result = InputChecker().validMoney(input: testInput)
        XCTAssertEqual(result, 5000)
    }

    func testAddBalance() {
        var stock = [Beverage]()
        let americano = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010")
        let energyDrink = EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20171010")

        for _ in 0..<2 {
            stock.append(americano)
            stock.append(energyDrink)
        }

        let testInput = 1
        let money = InputChecker().validMoney(input: testInput)
        let vending = VendingMachine(stockItems: stock)
        vending.addBalance(money: money)
        let result = vending.showBalance()
        XCTAssertEqual(result, 10000)
    }

    func testBuy_BALANCE() {
        var stock = [Beverage]()
        let americano = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010")
        let energyDrink = EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20171010")

        for _ in 0..<2 {
            stock.append(americano)
            stock.append(energyDrink)
        }

        let testInput = 1
        let money = InputChecker().validMoney(input: testInput)
        let vending = VendingMachine(stockItems: stock)
        vending.addBalance(money: money)
        vending.buy(itemSelected: americano, unit: 1)
        let resultBalance = vending.showBalance()
        XCTAssertEqual(resultBalance, 7000)
    }

    func testBuy_STOCK() {
        var stock = [Beverage]()
        let americano = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010")
        let energyDrink = EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20171010")

        for _ in 0..<2 {
            stock.append(americano)
            stock.append(energyDrink)
        }

        let testInput = 1
        let money = InputChecker().validMoney(input: testInput)
        let vending = VendingMachine(stockItems: stock)
        vending.addBalance(money: money)
        print("테스트" + vending.stock.description)
        vending.buy(itemSelected: energyDrink, unit: 1)
        print("테스트" + vending.stock.description)
    }

    func testAddItem_stock() {
        let beverages = [
            EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20171010"),
            ChocoMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다초코우유", manufactured: "20180212"),
            DolceLatte(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20171210"),
            BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20180213"),
            Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010"),
            SoftDrink(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20171005")
            ]
        var stock = Stock(items: beverages)
        print(stock.stockSummary())
        let input = 1
        let addingItem = beverages[input-1]
        stock.addItem(item: addingItem)
        print(stock.stockSummary())
        let result = stock.inventory[ObjectIdentifier(type(of:addingItem))]?.count
        XCTAssertEqual(result, 2)
    }

    func test_defaultCalorie() {
        let beverage = Beverage()
        XCTAssertTrue(beverage.isLowCalorie())
    }

    func testCalorie_softDrink() {
        let softDrink = SoftDrink(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20171005")
        XCTAssertFalse(softDrink.isLowCalorie())
    }

    func testCalorie_Coffee() {
        let coffee = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010")
        XCTAssertTrue(coffee.isLowCalorie())
    }

    func testExpiration() {
        let beverages = [
            EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20180123"),
            ChocoMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다초코우유", manufactured: "20180304"),
            DolceLatte(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20180210"),
            BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20180213"),
            Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010"),
            SoftDrink(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20171005")
        ]
        let vendingMachine = VendingMachine(stockItems: beverages)
        let valid = vendingMachine.validItems()
        print(valid)
        XCTAssertEqual(valid.keys.count, 4)
    }

    func testCheapestPrice() {
        let beverages = [
            EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20180123"),
            DolceLatte(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20180210"),
            Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010"),
            SoftDrink(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20171005")
        ]
        let vendingMachine = VendingMachine(stockItems: beverages)
        let result = vendingMachine.stock.cheapestPrice()
        XCTAssertEqual(result, 2000)
    }


    func testShelves() {
        let beverages = [
            EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20180123"),
            DolceLatte(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20180210"),
            Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010"),
            SoftDrink(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20171005"),
            Beverage(),
            Beverage()
        ]
        let vendingMachine = VendingMachine(stockItems: beverages)
        var stock = vendingMachine.stock
        print(stock.shelves.count)
        stock.removeItem(ObjectIdentifier(type(of: Beverage())))
        print(stock.shelves.count)
        stock.removeItem(ObjectIdentifier(type(of: Beverage())))
        print(stock.shelves.count)
        print(stock.inventory)
        XCTAssertEqual(stock.shelves.count, 4)
    }



}



