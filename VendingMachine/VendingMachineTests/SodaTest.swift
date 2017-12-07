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
        let cola: Beverage = Soda.init(category: .coke, brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라")
        XCTAssertEqual(cola.description, "콜라 - 펩시, 350ml, 2000원, 다이어트콜라, 20171207")
    }

}
