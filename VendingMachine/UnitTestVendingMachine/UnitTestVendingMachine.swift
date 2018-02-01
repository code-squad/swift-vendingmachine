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
        let bananaMilk = Milk(flavor: "바나나", brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20180125")
        XCTAssertEqual(true, bananaMilk.isValid())
    }

    func testExpiration_COKE() {
        let coke = SoftDrink(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", manufactured: "20171005")
        XCTAssertEqual(true, coke.isValid())
    }

    func testExpiration_COFFEE() {
        let coffee = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010")
        XCTAssertEqual(false, coffee.isValid())
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

    func testSetStock_Dictionary() {
        let result = Controller().setVendingMachineStock(unit: 5)
        print(result)
    }

    func testPrintStock() {
        var stock = [Beverage]()
        let chocoMilk = ChocoMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다초코우유", manufactured: "20180128")
        let bananaMilk = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20180128")
        let coke = SoftDrink(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20171005")
        let americano = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010")
        let dolceLatte = Coffee(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20171010")
        let energyDrink = EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20171010")

        for _ in 0..<5 {
            stock.append(chocoMilk)
            stock.append(bananaMilk)
            stock.append(coke)
            stock.append(americano)
            stock.append(dolceLatte)
            stock.append(energyDrink)
        }
        // 추가된 음료를 딕셔너리형태로 정렬
        let productSets = stock.reduce(into: [Beverage:[Beverage]]()) {
            $0[$1, default:[]].append($1)
        }

        let vendingMachine = VendingMachine(stock: productSets)
        let result = vendingMachine.showStock()
        print(result)
    }

    func testDiscard() {
        var stock = [Beverage]()
        let chocoMilk = ChocoMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다초코우유", manufactured: "20180130")
        let bananaMilk = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", manufactured: "20180128")
        let coke = SoftDrink(brand: "코카콜라", weight: 500, price: 2000, name: "제로코크", manufactured: "20171005")
        let americano = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactured: "20171010")
        let dolceLatte = Coffee(brand: "스타벅스", weight: 473, price: 6000, name: "돌체라떼", manufactured: "20171010")
        let energyDrink = EnergyDrink(brand: "레드불", weight: 350, price: 2000, name: "레드불", manufactured: "20171010")

        for _ in 0..<5 {
            stock.append(chocoMilk)
            stock.append(bananaMilk)
            stock.append(coke)
            stock.append(americano)
            stock.append(dolceLatte)
            stock.append(energyDrink)
        }
        // 추가된 음료를 딕셔너리형태로 정렬
        let productSets = stock.reduce(into: [Beverage:[Beverage]]()) {
            $0[$1, default:[]].append($1)
        }

        let vendingMachine = VendingMachine(stock: productSets)
        let result = vendingMachine.showDiscard()
        print(result)
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

}

