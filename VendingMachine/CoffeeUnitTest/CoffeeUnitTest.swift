//
//  CoffeeUnitTest.swift
//  CoffeeUnitTest
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import XCTest
@testable import VendingMachine

class CoffeeUnitTest: XCTestCase {
    let starBucks = StarBucksCoffee(reserve: true, caffeine: false, temperature: 98, volume: 500, price: 5600, name: "스타벅스 아메리카노", manufacturingDate: "20171214")
    
    func testDeCaffeineCoffee() {
        XCTAssertFalse(starBucks.isCaffeine())
    }
    
    func testIsHotDrink() {
        XCTAssertTrue(starBucks.isHot())
    }
    
    func testValidDate() {
        XCTAssertTrue(starBucks.validate(with: Date()))
    }
    
    func testReseve() {
        XCTAssertTrue(starBucks.isReserve())
    }
}
