//
//  BananaMilkTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class BananaMilkTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testBananaMilk() {
        let bananaMilk = BananaMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "바나나우유", validate: "20171220")
        XCTAssertEqual(bananaMilk.description, "바나나우유(BananaMilk) - 서울우유, 200ml, 1000원, 바나나우유, 20171208")
    }

}
