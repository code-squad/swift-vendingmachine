//
//  CantataUnittests.swift
//  VendingMachineUnitTest
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

@testable import VendingMachine

class CantataUnitTest: XCTestCase {
    
    func testCantataInstantiate_success() {
        XCTAssertNotNil(Cantata(brand: "칸타타", capacity: 200, price: 1000, name: "칸타타블렌디드", manufacturedDate: "20180101", caffeineContent: 120, flavor: "블렌디드", isHot: false))
    }
}

