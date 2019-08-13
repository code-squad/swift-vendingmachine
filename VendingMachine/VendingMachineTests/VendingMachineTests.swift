//
//  VendingMachineTests.swift
//  VendingMachineTests
//
//  Created by CHOMINJI on 13/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class VendingMachineTests: XCTestCase {
    func testMilk() {
        let strawberryMilk = StrawberryMilk(strawberryContent: 20)
        let chocolateMilk = ChocolateMilk(chocolateContent: 14)
        
        XCTAssertTrue(strawberryMilk.validate(with: Date("20190809")))
        XCTAssertFalse(chocolateMilk.validate(with: Date("20190820")))
    }
    
    func testCoke() {
        let coke = Coke(caffeineContent: 5)
        let cider = Cider(lemonScentContent: 2)
        
        XCTAssertFalse(coke.isLowCalorie)
        XCTAssertFalse(cider.isLowCalorie)
    }
    
    func testCoffee() {
        let top = Americano(waterContent: 70)
        let cantata = CaffeLatte(milkContent: 20)
        
        XCTAssertFalse(top.isHot)
        XCTAssertTrue(cantata.isHot)
    }
}
