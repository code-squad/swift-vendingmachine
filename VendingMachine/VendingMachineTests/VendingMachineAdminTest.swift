//
//  VendingMachineAdminTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 14..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class VendingMachineAdminTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testAdd() {
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let validate: Date = "20171220".getDateFromString()
        let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "딸기우유", dateOfManufacture: dateOfManufacture, validate: validate)
        let vendingMachine: VendingMachine = VendingMachine.init()
        let admin: VendingMachineAdmin = VendingMachineAdmin.init(vendingMachine: vendingMachine)
        XCTAssertEqual(admin.getInventory().count, 0)
        admin.add(product: strawberryMilk)
        XCTAssertEqual(admin.getInventory().count, 1)
    }

    func testGetExpiredProducts() {
        var dateOfManufacture: Date = "20171211".getDateFromString()
        let validate: Date = "20171220".getDateFromString()
        let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "딸기우유", dateOfManufacture: dateOfManufacture, validate: validate)

        dateOfManufacture = "20171207".getDateFromString()
        let expiredValidate: Date = "20171209".getDateFromString()
        let bananaMilk = BananaMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", dateOfManufacture: dateOfManufacture, validate: expiredValidate)
        let vendingMachine: VendingMachine = VendingMachine.init()
        let admin: VendingMachineAdmin = VendingMachineAdmin.init(vendingMachine: vendingMachine)
        admin.add(product: strawberryMilk)
        admin.add(product: bananaMilk)
        XCTAssertEqual(admin.getExpiredProducts(date: "20171210".getDateFromString()).count, 1)
    }

    func testGetSalesHistory() {
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let topCoffee = TOPCoffee.init(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", dateOfManufacture: dateOfManufacture, hot: true)
        let kantata = Kantata.init(brand: "Kantata", weight: 400, price: 3000, name: "칸타타", dateOfManufacture: dateOfManufacture, hot: true)
        let georgia = Georgia.init(brand: "코카콜라", weight: 400, price: 3000, name: "죠지아", dateOfManufacture: dateOfManufacture, hot: false)
        let topCategory: String = String(topCoffee.description.split(separator: "(")[0])
        let vendingMachine: VendingMachine = VendingMachine.init()
        let admin: VendingMachineAdmin = VendingMachineAdmin.init(vendingMachine: vendingMachine)
        admin.add(product: topCoffee)
        admin.add(product: kantata)
        var user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachine)
        user.buy(category: topCategory)
        admin.add(product: georgia)
        XCTAssertEqual(admin.getSalesHistory().count, 1)
    }

}
