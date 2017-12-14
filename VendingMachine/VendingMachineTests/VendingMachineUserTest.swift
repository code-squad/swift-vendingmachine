//
//  VendingMachineUserTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 14..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class VendingMachineUserTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    //    자판기 금액을 원하는 금액만큼 올리는 메소드
    func testInsertCoins() {
        let vendingMachine: VendingMachine = VendingMachine.init()
        let user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachine)
        XCTAssertEqual(user.getBalance(), 0)
        user.insertCoins(1000)
        XCTAssertEqual(user.getBalance(), 1000)
    }

    //    현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func testGetBuyableProducts() {
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let validate: Date = "20171220".getDateFromString()
        let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "딸기우유", dateOfManufacture: dateOfManufacture, validate: validate)
        let pepciCoke = PepciCoke.init(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", dateOfManufacture: dateOfManufacture, lowCalorie: true)
        var inventory: Inventory = [:]
        inventory["딸기우유"] = [strawberryMilk]
        inventory["펩시콜라"] = [pepciCoke]
        let vendingMachine: VendingMachine = VendingMachine.init(coins: 1000, inventory: inventory)
        let user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachine)
        XCTAssertEqual(user.getBuyableProducts().count, 1)
    }

    //    음료수를 구매하는 메소드
    func testBuy() {
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let validate: Date = "20171220".getDateFromString()
        let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "딸기우유", dateOfManufacture: dateOfManufacture, validate: validate)
        let pepciCoke = PepciCoke.init(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", dateOfManufacture: dateOfManufacture, lowCalorie: true)
        var inventory: Inventory = [:]
        inventory["딸기우유"] = [strawberryMilk]
        inventory["펩시콜라"] = [pepciCoke]
        let vendingMachine: VendingMachine = VendingMachine.init(coins: 1000, inventory: inventory)
        var user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachine)
        user.buy(category: String(strawberryMilk.description.split(separator: "(")[0]))
        XCTAssertEqual(user.getInventory().count, 1)
        XCTAssertEqual(user.getBuyableProducts().count, 0)
        XCTAssertEqual(user.getBalance(), 0)
    }

    //    잔액을 확인하는 메소드
    func testGetBalance() {
        let vendingMachine: VendingMachine = VendingMachine.init()
        let user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachine)
        XCTAssertEqual(user.getBalance(), 0)
        user.insertCoins(1000)
        XCTAssertEqual(user.getBalance(), 1000)
    }

    //    전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func testGetInventory() {
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let validate: Date = "20171220".getDateFromString()
        let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "딸기우유", dateOfManufacture: dateOfManufacture, validate: validate)
        let pepciCoke = PepciCoke.init(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", dateOfManufacture: dateOfManufacture, lowCalorie: true)
        var inventory: Inventory = [:]
        inventory["딸기우유"] = [strawberryMilk]
        inventory["펩시콜라"] = [pepciCoke]
        let vendingMachine: VendingMachine = VendingMachine.init(coins: 1000, inventory: inventory)
        let user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachine)
        XCTAssertEqual(user.getInventory().count, 2)
    }

    //    따뜻한 음료만 리턴하는 메소드
    func testGetHotProducts() {
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let topCoffee = TOPCoffee.init(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", dateOfManufacture: dateOfManufacture, hot: true)
        let kantata = Kantata.init(brand: "Kantata", weight: 400, price: 3000, name: "칸타타", dateOfManufacture: dateOfManufacture, hot: true)
        let georgia = Georgia.init(brand: "코카콜라", weight: 400, price: 3000, name: "죠지아", dateOfManufacture: dateOfManufacture, hot: false)
        var inventory: Inventory = [:]
        inventory[String(topCoffee.description.split(separator: "(")[0])] = [topCoffee]
        inventory[String(kantata.description.split(separator: "(")[0])] = [kantata]
        inventory[String(georgia.description.split(separator: "(")[0])] = [georgia]
        let vendingMachine: VendingMachine = VendingMachine.init(coins: 1000, inventory: inventory)
        let user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachine)
        XCTAssertEqual(user.getHotProducts().count, 2)
    }

    //    시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func testGetPurchaseList() {
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let topCoffee = TOPCoffee.init(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", dateOfManufacture: dateOfManufacture, hot: true)
        let kantata = Kantata.init(brand: "Kantata", weight: 400, price: 3000, name: "칸타타", dateOfManufacture: dateOfManufacture, hot: true)
        let georgia = Georgia.init(brand: "코카콜라", weight: 400, price: 3000, name: "죠지아", dateOfManufacture: dateOfManufacture, hot: false)
        var inventory: Inventory = [:]
        inventory[String(topCoffee.description.split(separator: "(")[0])] = [topCoffee]
        inventory[String(kantata.description.split(separator: "(")[0])] = [kantata]
        inventory[String(georgia.description.split(separator: "(")[0])] = [georgia]
        let vendingMachine: VendingMachine = VendingMachine.init(coins: 1000, inventory: inventory)
        var user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachine)
        XCTAssertEqual(user.purchaseList.count, 0)
        user.buy(category: String(kantata.description.split(separator: "(")[0]))
        XCTAssertEqual(user.purchaseList.count, 1)
    }

}
