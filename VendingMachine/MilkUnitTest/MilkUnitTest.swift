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
    let lightMilk = LightBananaMilk(brand: "빙그레", volume: 230, price: 1300, name: "저지방바나나우유", manufacturingDate: "20171213")
    let realMilk = RealBananaMilk(brand: "매일우유", volume: 270, price: 1200, name: "원래 바나나우유는 하얗다", manufacturingDate: "20171211")
    
    func testLightMilkIslowMilk() {
        XCTAssertTrue(lightMilk.isLowFact())
    }
    
    func testLightMilkHasBlueCap() {
        XCTAssertTrue(lightMilk.hasBlueCap())
    }
    
    //20171213
    func testValidateToday() {
        XCTAssertTrue(lightMilk.validate(with: Date()))
    }
    
    func testValidateIfValidatePassed() {
        let lightMilk = LightBananaMilk(brand: "빙그레", volume: 230, price: 2000, name: "저지방바나나우유", manufacturingDate: "20171206")
        XCTAssertFalse(lightMilk.validate(with: Date()))
    }
    
    func testRealMilkColor() {
        XCTAssertTrue(realMilk.isRealBanana())
    }
    
}
