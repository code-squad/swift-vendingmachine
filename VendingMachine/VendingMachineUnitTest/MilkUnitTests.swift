//
//  MilkUnitTests.swift
//  VendingMachineUnitTest
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

@testable import VendingMachine

class MilkUnitTest: XCTestCase {
    
    var milk: Milk!
    
    override func setUp() {
        super.setUp()
        self.milk = Milk(brand: "서울우유", capacity: 200, price: 1000, name: "흰우유", manufacturedDate: "20180303")
    }
    
    func testMilkInstantiate_success() {
        XCTAssertNotNil(Milk(brand: "서울우유", capacity: 200, price: 1000, name: "흰우유", manufacturedDate: "20180303"))
    }
    
    func testExpiredDateIsOver_withCheckDate() {
        let checkDate: Date = "20180314".customDateFormat
        XCTAssertTrue(self.milk.isOverExpired(with: checkDate))
    }
    
    func testExpiredDateIsNotOver_withCheckDate() {
        let checkDate: Date = "20180309".customDateFormat
        XCTAssertFalse(self.milk.isOverExpired(with: checkDate))
    }
}

