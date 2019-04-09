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
        XCTAssertNotNil(Soda(brand: "코니소다공장", volume: 500, price: 5000, name: "탄산이너무좋아", manufacturedDate: Date.changeString(beforeString: "10000101"), suger: true))
    }
    
    func test_Soda_맛있는소다음료_확인_당이_있다() {
        let conySoda = Soda(brand: "코니소다공장", volume: 500, price: 5000, name: "탄산이너무좋아", manufacturedDate: Date(), suger: true)
        XCTAssertTrue(conySoda.isSuger())
    }
    
    func test_Soda_맛있는소다음료_확인_당이_없다() {
        let conySoda = Soda(brand: "코니소다공장", volume: 200, price: 2500, name: "달짝지근한탄산이너무싫어", manufacturedDate: Date(), suger: false)
        XCTAssertFalse(conySoda.isSuger())
    }
    
    func test_Soda_코니콜라소다_탄산이_50인지_확인_맞다() {
        let conySoda = CocaCola()
        XCTAssertTrue(conySoda.same(50))
    }
    
    func test_Soda_코니콜라소다_탄산이_70인지_확인_아니다() {
        let conySoda = CocaCola()
        XCTAssertFalse(conySoda.same(70))
    }
    
    func test_Soda_코니스프라이트소다_탄산이_50인지_확인_맞다() {
        let conySoda = Sprite()
        XCTAssertTrue(conySoda.same(70))
    }
    
    func test_Soda_코니스프라이트소다_탄산이_70인지_확인_아니다() {
        let conySoda = Sprite()
        XCTAssertFalse(conySoda.same(50))
    }


    func test_Soda_코니콜라_유통기한_확인() {
        let conySoda = CocaCola()
        XCTAssertTrue(conySoda.isEqualExpirationDate())
    }

    
}
