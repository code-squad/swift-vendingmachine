//
//  SodaPopTest.swift
//  SodaPopTest
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import XCTest
@testable import VendingMachine

class SodaPopTest: XCTestCase {
    let orignalCoke = Coke(brand: "코카콜라(주)", volume: 270, price: 700, name: "코카콜라", manufacturingDate: "20171213", sugarContent: 40, labelColor: "RED", forWhere: false)
    
    func testCokeisLowCoke() {
        XCTAssertFalse(orignalCoke.isLowCoke())
    }
    
    func testIsForBusiness() {
        XCTAssertFalse(orignalCoke.isBusinessUse())
    }
}
