//
//  GeorgiaTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class GeorgiaTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGeorgia() {
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let georgia = Georgia.init(brand: "코카콜라", weight: 400, price: 3000,
                                   name: "Georgia", dateOfManufacture: dateOfManufacture, hot: true)
        XCTAssertEqual(georgia.description, "죠지아커피(Georgia) - 코카콜라, 400ml, 3000원, Georgia, 20171211")
    }

}
