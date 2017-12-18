//
//  SpriteTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class SpriteTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSprite() {
        let dateOfManufacture: Date = "20171211".getDateFromString()
        let sprite = Sprite.init(brand: "Sprite", weight: 500, price: 2000, name: "스프라이트",
                                 dateOfManufacture: dateOfManufacture, lowCalorie: false)
        XCTAssertEqual(sprite.description, "사이다(Sprite) - Sprite, 500ml, 2000원, 스프라이트, 20171211")
    }

}
