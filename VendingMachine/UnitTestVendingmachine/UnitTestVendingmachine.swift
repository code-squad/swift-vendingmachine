//
//  UnitTestVendingmachine.swift
//  UnitTestVendingmachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class UnitTestVendingmachine: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoffeeIsHot() {
        let top = TOP(brand: "맥심", ml: 400, price: 3000, productDate: "20190606", hot: false)
        let topHot = TOP(brand: "맥심", ml: 400, price: 3000, productDate: "20190608", hot: true)
        
        XCTAssertFalse(top.isHot())
        XCTAssertTrue(topHot.isHot())
    }
    
    func testMilkIsFarmCode() {
        let strawberryMilk = StrawberryMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190405", farmCode: 3)
        let bananaMilk = BananaMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190301", farmCode: 5)
        
        XCTAssertFalse(strawberryMilk.isFarmCode(5))
        XCTAssertTrue(strawberryMilk.isFarmCode(3))
        XCTAssertFalse(bananaMilk.isFarmCode(3))
        XCTAssertTrue(bananaMilk.isFarmCode(5))
    }

    func testSparklingIsLawCalorie() {
        let fanta = Fanta(brand: "롯데", ml: 350, price: 2000, productDate: "20190505")
        
        XCTAssertFalse(fanta.isLowCalorie())
    }
}
