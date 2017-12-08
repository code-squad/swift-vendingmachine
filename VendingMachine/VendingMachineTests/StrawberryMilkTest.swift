//
//  StrawberryMilkTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class StrawberryMilkTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testStrawberryMilk() {
        let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "딸기우유", validate: "20171210")
        XCTAssertEqual(strawberryMilk.description, "딸기우유(StrawberryMilk) - 서울우유, 200ml, 1000원, 딸기우유, 20171208")
    }

}
