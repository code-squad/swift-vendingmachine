//
//  CoffeeTest.swift
//  VendingMachineUnitTest
//
//  Created by 이진영 on 2019/10/24.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class CoffeeTest: XCTestCase {
    func testAmericano_isNotHot() {
        let americano = Americano(temperature: 10)
        
        XCTAssertFalse(americano.isHot)
    }
    
    func testCafeLatte_isNotHot() {
        let cafeLatte = CafeLatte()
        
        XCTAssertTrue(cafeLatte.isHot)
    }
    
    func testAmericano_isHot() {
        let americano = Americano(temperature: 70)
        
        XCTAssertTrue(americano.isHot)
    }
}
