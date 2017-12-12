//
//  VendingMachineTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 11..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class VendingMachineTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    //    자판기 금액을 원하는 금액만큼 올리는 메소드
    func testInsertCoins() {
        var vendingMachine: VendingMachine = VendingMachine.init()
        vendingMachine.insertCoins(1000)
        XCTAssertEqual(vendingMachine.getBalance(), 1000)
    }

    //    특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    func testAddProduct() {
        var vendingMachine: VendingMachine = VendingMachine.init()
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let validate: Date = "20171220".getDateFromString()
        let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "딸기우유", dateOfManufacture: dateOfManufacture, validate: validate)
        XCTAssertEqual(vendingMachine.getInventory().count, 0)
        vendingMachine.add(product: strawberryMilk)
        XCTAssertEqual(vendingMachine.getInventory().count, 1)
    }

    //    현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func testGetBuyableProducts() {
        var vendingMachine: VendingMachine = VendingMachine.init()
        vendingMachine.insertCoins(1000)
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let validate: Date = "20171220".getDateFromString()
        let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "딸기우유", dateOfManufacture: dateOfManufacture, validate: validate)
        let pepciCoke = PepciCoke.init(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", dateOfManufacture: dateOfManufacture, lowCalorie: true)
        vendingMachine.add(product: strawberryMilk)
        vendingMachine.add(product: pepciCoke)
        XCTAssertEqual(vendingMachine.getBuyableProducts().count, 1)
    }

    //    음료수를 구매하는 메소드
    func testBuy() {
        var vendingMachine: VendingMachine = VendingMachine.init()
        vendingMachine.insertCoins(1000)
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let validate: Date = "20171220".getDateFromString()
        let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "딸기우유", dateOfManufacture: dateOfManufacture, validate: validate)
        let pepciCoke = PepciCoke.init(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", dateOfManufacture: dateOfManufacture, lowCalorie: true)
        let strawBerryCategory = String(strawberryMilk.description.split(separator: "(")[0])
        vendingMachine.add(product: strawberryMilk)
        vendingMachine.add(product: pepciCoke)
        vendingMachine.buy(category: strawBerryCategory)
        XCTAssertEqual(vendingMachine.getInventory().count, 1)
        XCTAssertEqual(vendingMachine.getBuyableProducts().count, 0)
        XCTAssertEqual(vendingMachine.getBalance(), 0)
    }

    //    잔액을 확인하는 메소드
    func testGetBalance() {
        var vendingMachine: VendingMachine = VendingMachine.init()
        XCTAssertEqual(vendingMachine.getBalance(), 0)
        vendingMachine.insertCoins(1000)
        XCTAssertEqual(vendingMachine.getBalance(), 1000)
    }

    //    전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func testGetInventory() {
        var vendingMachine: VendingMachine = VendingMachine.init()
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let validate: Date = "20171220".getDateFromString()
        let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "딸기우유", dateOfManufacture: dateOfManufacture, validate: validate)
        let pepciCoke = PepciCoke.init(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", dateOfManufacture: dateOfManufacture, lowCalorie: true)
        vendingMachine.add(product: strawberryMilk)
        vendingMachine.add(product: pepciCoke)
        XCTAssertEqual(vendingMachine.getInventory().count, 2)
    }

    //    유통기한이 지난 재고만 리턴하는 메소드
    func testGetExpiredProducts() {
        var vendingMachine: VendingMachine = VendingMachine.init()
        var dateOfManufacture: Date = "20171211".getDateFromString()
        let validate: Date = "20171220".getDateFromString()
        let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "딸기우유", dateOfManufacture: dateOfManufacture, validate: validate)

        dateOfManufacture = "20171207".getDateFromString()
        let expiredValidate: Date = "20171209".getDateFromString()
        let bananaMilk = BananaMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", dateOfManufacture: dateOfManufacture, validate: expiredValidate)
        vendingMachine.add(product: strawberryMilk)
        vendingMachine.add(product: bananaMilk)
        XCTAssertEqual(vendingMachine.getExpiredProducts(date: "20171210".getDateFromString()).count, 1)
    }

    //    따뜻한 음료만 리턴하는 메소드
    func testGetHotProducts() {
        var vendingMachine: VendingMachine = VendingMachine.init()
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let topCoffee = TOPCoffee.init(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", dateOfManufacture: dateOfManufacture, hot: true)
        let kantata = Kantata.init(brand: "Kantata", weight: 400, price: 3000, name: "칸타타", dateOfManufacture: dateOfManufacture, hot: true)
        let georgia = Georgia.init(brand: "코카콜라", weight: 400, price: 3000, name: "죠지아", dateOfManufacture: dateOfManufacture, hot: false)
        vendingMachine.add(product: topCoffee)
        vendingMachine.add(product: kantata)
        vendingMachine.add(product: georgia)
        XCTAssertEqual(vendingMachine.getHotProducts().count, 2)
    }

    //    시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func testGetSalesHistory() {
        var vendingMachine: VendingMachine = VendingMachine.init()
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let topCoffee = TOPCoffee.init(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", dateOfManufacture: dateOfManufacture, hot: true)
        let kantata = Kantata.init(brand: "Kantata", weight: 400, price: 3000, name: "칸타타", dateOfManufacture: dateOfManufacture, hot: true)
        let georgia = Georgia.init(brand: "코카콜라", weight: 400, price: 3000, name: "죠지아", dateOfManufacture: dateOfManufacture, hot: false)
        let topCategory: String = String(topCoffee.description.split(separator: "(")[0])
        vendingMachine.add(product: topCoffee)
        vendingMachine.add(product: kantata)
        vendingMachine.buy(category: topCategory)
        vendingMachine.add(product: georgia)
        XCTAssertEqual(vendingMachine.getSalesHistory().count, 1)
    }

}
