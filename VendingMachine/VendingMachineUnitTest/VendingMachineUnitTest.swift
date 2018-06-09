//
//  VendingMachineUnitTest.swift
//  VendingMachineUnitTest
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

@testable import VendingMachine

class VendingMachineUnitTest: XCTestCase {
    
    func testVendingMachineInstantiate() {
        let vendingMachine: VendingMachine = VendingMachine()
        XCTAssertNotNil(vendingMachine)
    }
}
