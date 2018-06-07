//
//  SodaUnitTest.swift
//  VendingMachineUnitTest
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

@testable import VendingMachine

class SodaUnitTest: XCTestCase {
    
    func testSodaInstantiate_success() {
        XCTAssertNotNil(Soda(brand: "동아오츠카", capacity: 350, price: 2000, name: "포카리", manufacturedDate: "20180101", calories: 20))
    }
    
    func test99Calories_SodaIsLowCalories() {
        let testCalories = 99
        let soda = Soda(brand: "동아오츠카", capacity: 350, price: 2000, name: "포카리", manufacturedDate: "20180101", calories: testCalories)
        
        XCTAssertTrue(soda.isLowCalories())
    }
    
    func test100Calories_SodaIsNotLowCalories() {
        let testCalories = 100
        let soda = Soda(brand: "동아오츠카", capacity: 350, price: 2000, name: "포카리", manufacturedDate: "20180101", calories: testCalories)
        
        XCTAssertFalse(soda.isLowCalories())
    }
    
    func testMinus1Calories_SodaIsNotZeroCalories() {
        let testCalories = -1
        let soda = Soda(brand: "동아오츠카", capacity: 350, price: 2000, name: "포카리", manufacturedDate: "20180101", calories: testCalories)
        
        XCTAssertFalse(soda.isZeroCalories())
    }
    
    func test0Calories_SodaIsZeroCalories() {
        let testCalories = 0
        let soda = Soda(brand: "동아오츠카", capacity: 350, price: 2000, name: "포카리", manufacturedDate: "20180101", calories: testCalories)
        
        XCTAssertTrue(soda.isZeroCalories())
    }
    
    func test1Calories_SodaIsNotZeroCalories() {
        let testCalories = 1
        let soda = Soda(brand: "동아오츠카", capacity: 350, price: 2000, name: "포카리", manufacturedDate: "20180101", calories: testCalories)
        
        XCTAssertFalse(soda.isZeroCalories())
    }
    
}
