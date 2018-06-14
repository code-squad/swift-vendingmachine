//
//  TOPUnitTests.swift
//  VendingMachineUnitTest
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

@testable import VendingMachine

class TOPUnitTest: XCTestCase {
    
    func testTOPInstatiate_success() {
        XCTAssertNotNil(TOP(brand: "맥심", capacity: 400, price: 300, name: "TOP아메리카노", manufacturedDate: "20171010", caffeineContent: 100, canColor: .black, isHot: false))
    }
}
