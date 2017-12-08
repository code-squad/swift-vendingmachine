//
//  TOPCoffeeTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class TOPCoffeeTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTOPCoffee() {
        let topCoffee = TOPCoffee.init(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", hot: true)
        XCTAssertEqual(topCoffee.description, "TOP커피(TOPCoffee) - 맥심, 400ml, 3000원, TOP아메리카노, 20171208")
    }

}
