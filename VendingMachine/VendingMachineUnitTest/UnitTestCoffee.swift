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
        XCTAssertNotNil(Coffee(brand: "코니커피공장",
                               volume: 500,
                               price: 5000,
                               name: "카페인이너무좋아",
                               manufacturedDate: Date.changeString(beforeString: "10000101"),
                               expiryPeriod: 60))
    }

    func test_Coffee_카페인있는향이좋은커피_카페인이_10인지_확인_맞다() {
        let conyCoffee = Coffee(brand: "코니커피공장",
                                volume: 500,
                                price: 5000,
                                name: "카페인20좋아",
                                manufacturedDate: Date(),
                                caffeine: 10 ,
                                expiryPeriod: 60)
        XCTAssertTrue(conyCoffee.same(10))
    }

    func test_Coffee_카페인있는향이좋은커피_카페인이_20인지_확인_아니다() {
        let conyCoffee = Coffee(brand: "코니커피공장",
                                volume: 500,
                                price: 5000,
                                name: "카페인10좋아",
                                manufacturedDate: Date(),
                                caffeine: 10 ,
                                expiryPeriod: 60)
        XCTAssertFalse(conyCoffee.same(20))
    }

    func test_Coffee_코니커피_유통기한_확인_유통기한지나서_False() {
        let conyCoffee = CantataCoffee()
        XCTAssertFalse(conyCoffee.isEqualExpirationDate())
    }

}
