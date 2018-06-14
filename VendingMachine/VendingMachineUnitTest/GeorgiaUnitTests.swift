//
//  GeorgiaUnitTests.swift
//  VendingMachineUnitTest
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

@testable import VendingMachine

class GeorgiaUnitTest: XCTestCase {
    
    func testGeorgiaInstantiate_success() {
        XCTAssertNotNil(Georgia(brand: "조지아", capacity: 300, price: 2000, name: "조지아커피", manufacturedDate: "20180202", caffeineContent: 120.5, flavor: "오리지널", isHot: false))
    }
}

