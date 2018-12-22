//
//  UnitTestBeverage.swift
//  UnitTestBeverage
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestBeverage: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMandarineMilk() {
        let mandarineMilk = MandarineMilk()
        XCTAssertEqual(mandarineMilk.hasLactose(), true)
    }
    
    func testtLacotseFreeMilk() {
        let lactoseFreeMilk = LactoseFreeMilk()
        XCTAssertEqual(lactoseFreeMilk.hasLactose(), false)
    }

    func testStarbucksDoubleShot() {
        let starbucksDS = StarbucksDoubleShot()
        XCTAssertEqual(starbucksDS.isHot, true)
        XCTAssertEqual(starbucksDS.hasMilk, true)
    }
    
    func testTOPTheBlack() {
        let topTheBlack = TOPTheBlack()
        XCTAssertEqual(topTheBlack.hasMilk, false)
        XCTAssertEqual(topTheBlack.isHot, false)
    }
    
    func testCocaCola() {
        let cocaCola = CocaCola()
        XCTAssertEqual(cocaCola.isLowCalorie(), false)
    }
    
    func testCocaColaZero() {
        let cocaColaZero = CocaColaZero()
        XCTAssertEqual(cocaColaZero.isLowCalorie(), true)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
