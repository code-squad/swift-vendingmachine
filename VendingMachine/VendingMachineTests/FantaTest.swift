//
//  FantaTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class FantaTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFanta() {
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let fanta = Fanta.init(brand: "Fanta", weight: 350, price: 1500, name: "환타",
                               dateOfManufacture: dateOfManufacture, lowCalorie: false)
        XCTAssertEqual(fanta.description, "환타(Fanta) - Fanta, 350ml, 1500원, 환타, 20171211")
    }

}
