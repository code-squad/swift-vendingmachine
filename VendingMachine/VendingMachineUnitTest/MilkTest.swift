//
//  MilkTest.swift
//  VendingMachineUnitTest
//
//  Created by 이진영 on 2019/10/24.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class MilkTest: XCTestCase {
    func testMilk_isNotLowFat() {
        let milk = Milk(brand: "서울우유", capacity: 100, price: 1000, name: "나100%", expirationDate: Date(), temperature: 10, fatContent: 4)
        
        XCTAssertFalse(milk.isLowFat)
    }
    
    func testChochlateMilk_isLowFat() {
        let chochlateMilk = ChocolateMilk()
        
        XCTAssertTrue(chochlateMilk.isLowFat)
    }
    
    func testStrawberryMilk_isLowFat() {
        let strawberryMilk = StrawberryMilk()
        
        XCTAssertTrue(strawberryMilk.isLowFat)
    }

}
