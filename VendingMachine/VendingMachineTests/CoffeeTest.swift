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
        let coffee: Beverage = Coffee.init(category: .top, brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노")
        XCTAssertEqual(coffee.description, "T.O.P - 맥심, 400ml, 3000원, TOP아메리카노, 20171207")
    }

}
