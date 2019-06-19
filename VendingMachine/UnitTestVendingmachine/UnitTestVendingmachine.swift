//
//  UnitTestVendingmachine.swift
//  UnitTestVendingmachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class UnitTestVendingmachine: XCTestCase {
    var top: TOP!
    var topHot: TOP!
    var strawberryMilk: StrawberryMilk!
    var bananaMilk: BananaMilk!
    var fanta: Fanta!
    
    override func setUp() {
        top = TOP(brand: "맥심", ml: 400, price: 3000, productDate: "20190606", hot: false, expirationDate: "20190615")
        topHot = TOP(brand: "맥심", ml: 400, price: 3000, productDate: "20190608", hot: true, expirationDate: "20190630")
        strawberryMilk = StrawberryMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190405", farmCode: 3, expirationDate: "20190505")
        bananaMilk = BananaMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190301", farmCode: 5, expirationDate: "20190405")
        fanta = Fanta(brand: "롯데", ml: 350, price: 2000, productDate: "20190505", orangeIncense: 0.3, expirationDate: "20190924")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoffeeIsHot() {
        XCTAssertFalse(top.isHot())
        XCTAssertTrue(topHot.isHot())
    }
    
    func testMilkIsFarmCode() {
        XCTAssertFalse(strawberryMilk.isFarmCode(5))
        XCTAssertTrue(strawberryMilk.isFarmCode(3))
        XCTAssertFalse(bananaMilk.isFarmCode(3))
        XCTAssertTrue(bananaMilk.isFarmCode(5))
    }

    func testSparklingIsLawCalorie() {
        XCTAssertFalse(fanta.isLowCalorie())
    }
    
    func testExpirationDateValidate() {
        XCTAssertFalse(top.validate(with: "20190619"))
        XCTAssertTrue(topHot.validate(with: "20190619"))
        XCTAssertFalse(strawberryMilk.validate(with: "20190619"))
        XCTAssertFalse(bananaMilk.validate(with: "20190619"))
        XCTAssertTrue(fanta.validate(with: "20190619"))
    }
    
    func testFantaIsOrangeIncense() {
        XCTAssertTrue(fanta.isOrangeIncense(0.3))
        XCTAssertFalse(fanta.isOrangeIncense(0.5))
    }
    
    func testTOPIsTopLevelCoffeebeanContainPercent () {
        XCTAssertTrue(top.isTopLevelCoffeebeanContainPercent(0.5))
        XCTAssertFalse(top.isTopLevelCoffeebeanContainPercent(0.3))
    }
    
    func testBananaMilkIsLessthanbananaContainPercent () {
        XCTAssertTrue(bananaMilk.isLessthanBananaContainPercent(0.5))
        XCTAssertFalse(bananaMilk.isLessthanBananaContainPercent(0.2))
    }
    
    func testStrawberryMilkIsLessthanbananaContainPercent () {
        XCTAssertTrue(strawberryMilk.isLessthanStrawberryContainPercent(0.5))
        XCTAssertFalse(strawberryMilk.isLessthanStrawberryContainPercent(0.4))
    }
}
