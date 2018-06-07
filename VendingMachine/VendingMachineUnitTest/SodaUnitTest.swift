//
//  SodaUnitTest.swift
//  VendingMachineUnitTest
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

@testable import VendingMachine

class SodaUnitTest: XCTestCase {

    func testSodaInstantiate_success() {
        XCTAssertNotNil(Soda(brand: "동아오츠카", capacity: 350, price: 2000, name: "포카리", manufacturedDate: "20180101", calories: 20))
    }
}
