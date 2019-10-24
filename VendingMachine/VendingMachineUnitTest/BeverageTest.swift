//
//  BeverageTest.swift
//  VendingMachineUnitTest
//
//  Created by 이진영 on 2019/10/24.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class BeverageTest: XCTestCase {
    func testBeverage_pastExpirationDate() {
        let beverage = Beverage(brand: "브랜드", capacity: 100, price: 1000, name: "음료수", expirationDate: Date("20190101"))
        
        XCTAssertFalse(beverage.validate(with: Date()))
    }
    
    func testBeverage_validExpirationDate() {
        let beverage = Beverage(brand: "브랜드", capacity: 100, price: 1000, name: "음료수", expirationDate: Date("20191001"))
        
        XCTAssertTrue(beverage.validate(with: Date("20190901")))
    }
}
