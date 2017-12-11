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
        let strawberryMilk = Milk.init(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", validate: "20171212")
        XCTAssertEqual(strawberryMilk.description, "서울우유, 200ml, 1000원, 날마다딸기우유, 20171211")
        let bananaMilk = Milk.init(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", validate: "20171212")
        XCTAssertEqual(bananaMilk.description, "서울우유, 200ml, 1000원, 날마다바나나우유, 20171211")
    }

    func testValidate() {
        let strawberryMilk = Milk.init(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", validate: "20171212")
        XCTAssertTrue(strawberryMilk.validate(with: Date()))

        let bananaMilk = Milk.init(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", validate: "20171201")
        XCTAssertFalse(bananaMilk.validate(with: Date()))
    }

}
