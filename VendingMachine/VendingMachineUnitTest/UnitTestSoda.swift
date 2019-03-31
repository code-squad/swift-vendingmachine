//
//  UnitTestSoda.swift
//  VendingMachineUnitTest
//
//  Created by Elena on 29/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class UnitTestSoda: XCTestCase {
    
    func test_Soda_객체만들기_성공() {
        XCTAssertNotNil(Soda(brand: "코니소다공장", volume: 500, price: 5000, name: "탄산이너무좋아", manufacturedDate: Date.changeString(beforeDate: "10000101"), suger: true))
    }
    
    func test_Soda_맛있는소다음료_확인_당여부() {
        let conySoda = Soda(brand: "코니소다공장", volume: 500, price: 5000, name: "탄산이너무좋아", manufacturedDate: Date(), suger: true)
        XCTAssertTrue(conySoda.isSuger())
    }
    
    func test_Soda_코니콜라소다_색소_확인() {
        let conySoda = CocaCola()
        XCTAssertNotNil(conySoda.isColoring())
    }
    
    func test_Soda_코니스프라이트_색소값_확인() {
        let conySoda = Sprite()
        XCTAssertTrue(conySoda.isColoring() == "transparency")
    }
    
    func test_Soda_코니콜라_유통기한_확인() {
        let conySoda = CocaCola()
        XCTAssertTrue(conySoda.isEqualExpirationDate(endDate: 365))
    }
    
    func test_Soda_코니콜라_유통기한지난상품_먹으면안되는상품() {
        let conySoda = CocaCola()
        XCTAssertFalse(conySoda.isEqualExpirationDate(endDate: 1))
    }
}
