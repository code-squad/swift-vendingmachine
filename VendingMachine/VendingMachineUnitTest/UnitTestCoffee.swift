//
//  UnitTestCoffee.swift
//  VendingMachineUnitTest
//
//  Created by Elena on 31/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class UnitTestCoffee: XCTestCase {
    
    func test_Coffee_객체만들기_성공() {
        XCTAssertNotNil(Coffee(brand: "코니소다공장", volume: 500, price: 5000, name: "탄산이너무좋아", manufacturedDate: Date.changeString(beforeDate: "10000101")))
    }
    
    func test_Coffee_카페인있는향이좋은커피_카페인확인() {
        let conyCoffee = Coffee(brand: "코니커피공장", volume: 500, price: 5000, name: "커피가너무좋아", manufacturedDate: Date(), caffeine: 10)
        XCTAssertNotNil(conyCoffee.isCaffeine())
    }
    
    func test_Coffee_카페인있는향이좋은커피_카페인적지않으면_Nil_확인() {
        let conyCoffee = Coffee(brand: "코니커피공장", volume: 500, price: 5000, name: "커피가너무좋아", manufacturedDate: Date())
        XCTAssertNil(conyCoffee.isCaffeine())
    }
    
 
}
