//
//  PepciCokeTest.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 8..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import VendingMachine

class PepciCokeTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testPepciCoke() {
        let pepciCoke = PepciCoke.init(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", lowCalorie: true)
        XCTAssertEqual(pepciCoke.description, "펩시콜라(PepciCoke) - 펩시, 350ml, 2000원, 다이어트콜라, 20171208")
    }

}
