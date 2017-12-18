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

    func testVeningMachine_basic() {
        let vendingMachine: VendingMachine = VendingMachine.init()
        XCTAssertEqual(vendingMachine.description, "coins: 0원, inventory: [:]")
    }

    func testVeningMachine_properties() {
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let validate: Date = "20171220".getDateFromString()
        let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000,
                                                 name: "딸기우유", dateOfManufacture: dateOfManufacture, validate: validate)
        let pepciCoke = PepciCoke.init(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라",
                                       dateOfManufacture: dateOfManufacture, lowCalorie: true)
        var inventory: Inventory = [:]
        inventory["딸기우유"] = [strawberryMilk]
        inventory["펩시콜라"] = [pepciCoke]
        let vendingMachine: VendingMachine = VendingMachine.init(coins: 1000, inventory: inventory)
        var expectedResult: String = "coins: 1000원, inventory: ["
        expectedResult += "\"딸기우유\": [딸기우유(StrawberryMilk) - 서울우유, 200ml, 1000원, 딸기우유, 20171211], "
        expectedResult += "\"펩시콜라\": [펩시콜라(PepciCoke) - 펩시, 350ml, 2000원, 다이어트콜라, 20171211]]"
        XCTAssertEqual(vendingMachine.description, expectedResult)
    }

}
