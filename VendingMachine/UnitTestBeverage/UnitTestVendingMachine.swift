//
//  UnitTestVendingMachine.swift
//  UnitTestBeverage
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        var VM = VendingMachine()
        VM.insert(money: 1100)
        
        let mandarineMilk = MandarineMilk(openDate: Date(before: 2))
        let lactoseFreeMilk = LactoseFreeMilk(openDate: Date(before: 3))
        let starbucksDoubleShot = StarbucksDoubleShot(openDate: Date(before: 6))
        let topTheBlack = TOPTheBlack(openDate: Date(before: 7))
        let cocaCola = CocaCola(openDate: Date(before: 4))
        let cocaColaZero = CocaColaZero(openDate: Date(before: 9))
        
        VM.add(product: mandarineMilk)
        VM.add(product: lactoseFreeMilk)
        VM.add(product: lactoseFreeMilk)
        VM.add(product: cocaCola)
        VM.add(product: cocaCola)
        VM.add(product: cocaCola)
        VM.add(product: starbucksDoubleShot)
        VM.add(product: starbucksDoubleShot)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
