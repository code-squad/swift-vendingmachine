//
//  MilkUnitTest.swift
//  MilkUnitTest
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import XCTest
@testable import VendingMachine

class MilkUnitTest: XCTestCase {
    let lightMilk = LightBananaMilk(volume: 270, price: 1400, manufacturingDate: "20171215")
    let realMilk = RealBananaMilk(volume: 270, price: 1200, manufacturingDate: "20171209")
    
    func testLightMilkIslowMilk() {
        XCTAssertTrue(lightMilk.isLowFat())
    }
    
    func testLightMilkHasBlueCap() {
        XCTAssertTrue(lightMilk.hasBlueCap())
    }
    
    //20171213
    func testValidateToday() {
        XCTAssertTrue(lightMilk.validate(with: Date()))
    }
    
    func testValidateIfValidatePassed() {
        let lightMilk = LightBananaMilk(volume: 270, price: 1400, manufacturingDate: "20171206")
        XCTAssertFalse(lightMilk.validate(with: Date()))
    }
    
    func testRealMilkColor() {
        XCTAssertTrue(realMilk.isRealBanana())
    }
    
}
