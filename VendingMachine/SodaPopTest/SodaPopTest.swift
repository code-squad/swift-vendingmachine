//
//  SodaPopTest.swift
//  SodaPopTest
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import XCTest
@testable import VendingMachine

class SodaPopTest: XCTestCase {
    let orignalCoke = Coke(sugarContent: 40, volume: 250, price: 700, name: "CocaCola", manufacturingDate: "20171213", labelColor: "RED", forBusiness: false)
    let zeroCoke = Coke(sugarContent: 10, volume: 250, price: 800, name: "ZeroCoke", manufacturingDate: "20151213", labelColor: "BLACK", forBusiness: true)
    
    func testCokeisLowCoke() {
        XCTAssertTrue(orignalCoke.isHighSugar())
    }
    
    func testIsForBusiness() {
        XCTAssertFalse(orignalCoke.isBusinessUse())
    }
    
    func testIsZeroCoke() {
        XCTAssertTrue(zeroCoke.isHighSugar())
    }
    
    func testInvalidate() {
        XCTAssertFalse(zeroCoke.validate(with: Date()))
    }
}
