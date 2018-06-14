//
//  CokeUnitTest.swift
//  VendingMachineUnitTest
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

@testable import VendingMachine

class CokeUnitTest: XCTestCase {

    func testCokeInstantiate_success() {
        XCTAssertNotNil(Coke(brand: "코카콜라", capacity: 250, price: 1000, name: "코카콜라", manufacturedDate: "20180101", calories: 100, hasIce: false, isHot: false))
    }
}
