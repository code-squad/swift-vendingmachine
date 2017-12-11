//
//  BeverageTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 11..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class BeverageTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testBeverage() {
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let beverage: Beverage = Beverage.init(brand: "test", weight: 100, price: 1000, name: "tester", dateOfManufacture: dateOfManufacture)
        XCTAssertEqual(beverage.description, "test, 100ml, 1000원, tester, 20171211")
    }

}
