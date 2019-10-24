//
//  SodaTest.swift
//  VendingMachineUnitTest
//
//  Created by 이진영 on 2019/10/24.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class SodaTest: XCTestCase {
    func testCoke_isNotSugarFree() {
        let coke = Coke()
        
        XCTAssertFalse(coke.isSugarFree)
    }
    
    func testLemonlimeDrink_isNotSugarFree() {
        let lemonlimeDrink = LemonlimeDrink()
        
        XCTAssertFalse(lemonlimeDrink.isSugarFree)
    }
    
    func testZeroCoke_isSugarFree() {
        let zeroCoke = Coke(brand: "코카콜라", capacity: 250, price: 1500, name: "코카콜라 제로", expirationDate: Date(), sugarContent: 0, caffeineContent: 24.25)
        
        XCTAssertTrue(zeroCoke.isSugarFree)
    }

}
