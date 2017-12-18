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
    var vendingMachineMock: VendingMachineMock!

    override func setUp() {
        super.setUp()
        vendingMachineMock = VendingMachineMock.init()
    }

    override func tearDown() {
        vendingMachineMock = nil
        super.tearDown()
    }

    func testAdd() {
        var admin: VendingMachineAdmin = VendingMachineAdmin.init(vendingMachine: vendingMachineMock)
        XCTAssertEqual(admin.getInventory().count, 6)
        let chocolateMilk = ChocolateMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "초코우유", dateOfManufacture: "20171207".getDateFromString(), validate: "20171220".getDateFromString())
        admin.add(product: chocolateMilk)
        XCTAssertEqual(admin.getInventory().count, 7)
    }

    func testGetExpiredProducts() {
        let admin: VendingMachineAdmin = VendingMachineAdmin.init(vendingMachine: vendingMachineMock)
        XCTAssertEqual(admin.getExpiredProducts(date: "20171210".getDateFromString()).count, 1)
    }

    func testGetSalesHistory() {
        let admin: VendingMachineAdmin = VendingMachineAdmin.init(vendingMachine: vendingMachineMock)
        var user: VendingMachineUser = VendingMachineUser.init(vendingMachine: vendingMachineMock)
        XCTAssertEqual(admin.getSalesHistory().count, 0)
        user.buy(category: "TOP커피")
        XCTAssertEqual(admin.getSalesHistory().count, 1)
    }

    func testGetInventory() {
        let admin: VendingMachineAdmin = VendingMachineAdmin.init(vendingMachine: vendingMachineMock)
        XCTAssertEqual(admin.getInventory().count, 6)
        XCTAssertEqual(admin.getInventory().description, "[\"칸타타커피\": [칸타타커피(Kantata) - Kantata, 400ml, 3000원, 칸타타, 20171207], \"TOP커피\": [TOP커피(TOPCoffee) - 맥심, 400ml, 3000원, TOP아메리카노, 20171207], \"죠지아커피\": [죠지아커피(Georgia) - 코카콜라, 400ml, 3000원, 죠지아, 20171207], \"펩시콜라\": [펩시콜라(PepciCoke) - 펩시, 350ml, 2000원, 다이어트콜라, 20171207], \"딸기우유\": [딸기우유(StrawberryMilk) - 서울우유, 200ml, 1000원, 딸기우유, 20171207], \"바나나우유\": [바나나우유(BananaMilk) - 서울우유, 200ml, 1000원, 날마다바나나우유, 20171207]]")
    }

    func testRemove() {
        let admin: VendingMachineAdmin = VendingMachineAdmin.init(vendingMachine: vendingMachineMock)
        XCTAssertEqual(admin.getInventory().count, 6)
        XCTAssertEqual(admin.getInventory().description, "[\"칸타타커피\": [칸타타커피(Kantata) - Kantata, 400ml, 3000원, 칸타타, 20171207], \"TOP커피\": [TOP커피(TOPCoffee) - 맥심, 400ml, 3000원, TOP아메리카노, 20171207], \"죠지아커피\": [죠지아커피(Georgia) - 코카콜라, 400ml, 3000원, 죠지아, 20171207], \"펩시콜라\": [펩시콜라(PepciCoke) - 펩시, 350ml, 2000원, 다이어트콜라, 20171207], \"딸기우유\": [딸기우유(StrawberryMilk) - 서울우유, 200ml, 1000원, 딸기우유, 20171207], \"바나나우유\": [바나나우유(BananaMilk) - 서울우유, 200ml, 1000원, 날마다바나나우유, 20171207]]")
        let kantata = Kantata.init(brand: "Kantata", weight: 400, price: 3000, name: "칸타타", dateOfManufacture: "20171207".getDateFromString(), hot: true)
        admin.remove(product: kantata)
        XCTAssertEqual(admin.getInventory().count, 5)
        XCTAssertEqual(admin.getInventory().description, "[\"죠지아커피\": [죠지아커피(Georgia) - 코카콜라, 400ml, 3000원, 죠지아, 20171207], \"TOP커피\": [TOP커피(TOPCoffee) - 맥심, 400ml, 3000원, TOP아메리카노, 20171207], \"펩시콜라\": [펩시콜라(PepciCoke) - 펩시, 350ml, 2000원, 다이어트콜라, 20171207], \"딸기우유\": [딸기우유(StrawberryMilk) - 서울우유, 200ml, 1000원, 딸기우유, 20171207], \"바나나우유\": [바나나우유(BananaMilk) - 서울우유, 200ml, 1000원, 날마다바나나우유, 20171207]]")
    }

}
