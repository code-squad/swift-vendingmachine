//
//  SodaTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class SodaTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSodaDescription() {
        let cola = Soda.init(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", lowCalorie: true)
        XCTAssertEqual(cola.description, "펩시, 350ml, 2000원, 다이어트콜라, 20171208")
    }

    func testLowCalorie() {
        let lowSoda = Soda.init(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", lowCalorie: true)
        XCTAssertTrue(lowSoda.isLowCalorie())
        let notLowSoda = Soda.init(brand: "펩시", weight: 350, price: 2000, name: "콜라", lowCalorie: false)
        XCTAssertFalse(notLowSoda.isLowCalorie())
    }

}
