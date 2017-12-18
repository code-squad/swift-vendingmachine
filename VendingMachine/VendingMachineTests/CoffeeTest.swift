//
//  CoffeeTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class CoffeeTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCoffeeDescription() {
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let coffee = Coffee.init(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노",
                                 dateOfManufacture: dateOfManufacture, hot: true)
        XCTAssertEqual(coffee.description, "맥심, 400ml, 3000원, TOP아메리카노, 20171211")
    }

    func testIsHot() {
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let hotCoffee = Coffee.init(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노",
                                    dateOfManufacture: dateOfManufacture, hot: true)
        XCTAssertTrue(hotCoffee.isHot())

        let noHotCoffee = Coffee.init(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노",
                                      dateOfManufacture: dateOfManufacture, hot: false)
        XCTAssertFalse(noHotCoffee.isHot())
    }

}
