//
//  TestHierarchyDrink.swift
//  TestHierarchyDrink
//
//  Created by 윤동민 on 28/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestCarbonatedInterface: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCarbonatedDrinkInterface() {
        let carbonatedDrink: CarbonatedDrink = CarbonatedDrink(name: "칠성사이다", volume: 200, price: 1000, brand: "다이어트사이다", date: "20180910", isZeroCalorie: true)
        XCTAssertEqual(carbonatedDrink.isZeroCalorieDrink(), true)
    }
    
    func testColaInterface() {
        let cola: Cola = Cola(name: "펩시", volume: 200, price: 1000, brand: "다이어트콜라", date: "20181110", isZeroCalorie: true, sugarAmount: 2.0)
        XCTAssertEqual(cola.howMuchSugarAmount(), 2.0)
    }
    
    func testFantaInterface() {
        let fanta: Fanta = Fanta(name: "환타", volume: 200, price: 1500, brand: "다이어트환타", date: "20181111", isZeroCalorie: false, fantaFlavor: .orange)
        XCTAssertEqual(fanta.whatIsFlavor(), .orange)
    }
}
