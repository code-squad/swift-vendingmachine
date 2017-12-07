//
//  MilkTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class MilkTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testMilkDescription() {
        let strawberryMilk: Beverage = Milk.init(category: .strawberry, brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유")
        XCTAssertEqual(strawberryMilk.description, "딸기우유 - 서울우유, 200ml, 1000원, 날마다딸기우유, 20171207")
        let bananaMilk: Beverage = Milk.init(category: .banana, brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유")
        XCTAssertEqual(bananaMilk.description, "바나나우유 - 서울우유, 200ml, 1000원, 날마다바나나우유, 20171207")
    }

}
