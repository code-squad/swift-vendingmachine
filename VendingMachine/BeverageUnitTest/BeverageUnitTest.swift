//
//  BeverageUnitTest.swift
//  BeverageUnitTest
//
//  Created by 김성현 on 25/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class BeverageUnitTest: XCTestCase {

    func testExpirationDate() {
        let top = TOPCoffee(dateOfManufacture: Date(year: 2019, month: .january, day: 21)!)
        XCTAssert(top.isExpired(targetDate: Date(year: 2020, month: .december, day: 2)!))
        XCTAssertFalse(top.isExpired(targetDate: Date(year: 2019, month: .february, day: 12)!))
    }
    
    func testHotDrink() {
        
        let cantata = CantataCoffee(dateOfManufacture: Date())
        XCTAssert(cantata.isHot)
        
        let top = TOPCoffee(dateOfManufacture: Date())
        XCTAssertFalse(top.isHot)
    }
    
    func testLowCalorieSoftDrink() {
        let cola = Cola(dateOfManufacture: Date())
        XCTAssertFalse(cola.isLowCalorie)
    }
}
