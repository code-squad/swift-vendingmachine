//
//  ChocoMilkUnitTest.swift
//  VendingMachineUnitTest
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

@testable import VendingMachine

class ChocoMilkUnitTest: XCTestCase {

    func testChocoMilkInstantiate_success() {
        XCTAssertNotNil(ChocoMilk(brand: "서울우유", capacity: 500, price: 1300, name: "딸기맛우유", manufacturedDate: "20180101", hasCacao: true))
    }
}
