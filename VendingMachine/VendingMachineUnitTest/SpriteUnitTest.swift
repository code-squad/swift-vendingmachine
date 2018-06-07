//
//  SpriteUnitTest.swift
//  VendingMachineUnitTest
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

@testable import VendingMachine

class SpriteUnitTest: XCTestCase {

    func testSpriteInstantiate_success() {
        XCTAssertNotNil(Sprite(brand: "칠성", capacity: 250, price: 1000, name: "칠성사이다", manufacturedDate: "20180601", calories: 90, hasOneMoreOnCap: false))
    }
}
