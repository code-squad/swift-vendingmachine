//
//  BeverageUnitTests.swift
//  VendingMachineUnitTest
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

@testable import VendingMachine

class BeverageUnitTests: XCTestCase {
    
    func testBeverageDescription() {
        let beverage: Beverage = Beverage(brand: "서울우유", capacity: 200, price: 1000, name: "날마다딸기우유", manufacturedDate: "20171009")
        
        XCTAssertEqual(beverage.description, "Beverage - 서울우유, 200ml, 1000원, 날마다딸기우유, 20171009")
    }
    
}
