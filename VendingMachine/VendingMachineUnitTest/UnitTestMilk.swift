//
//  UnitTestMilk.swift
//  VendingMachineUnitTest
//
//  Created by Elena on 31/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class UnitTestMilk: XCTestCase {
    func test_Milk_객체만들기_성공() {
        XCTAssertNotNil(Milk(brand: "코니우유공장",
                             volume: 500,
                             price: 5000,
                             name: "우유가너무좋아",
                             manufacturedDate: Date.changeString(beforeString: "10000101"),
                             expiryPeriod: 7))
    }

    func test_Milk_우유_등급확인_A_성공() {
        let conyMilk = Milk(brand: "코니우유공장",
                            volume: 500,
                            price: 5000,
                            name: "신선한우유",
                            manufacturedDate: Date(),
                            expiryPeriod: 7)
        XCTAssertTrue(conyMilk.same(MilkGrade.A))
    }

    func test_Milk_우유_등급확인_실패() {
        let conyMilk = Milk(brand: "코니우유공장",
                            volume: 500,
                            price: 5000,
                            name: "신선한우유",
                            manufacturedDate: Date(),
                            expiryPeriod: 7)
        XCTAssertFalse(conyMilk.same(MilkGrade.C))
    }

    func test_Milk_코니우유_유통기한_확인_유통기한지나서_False() {
        let conyMilk = ChocolateMilk()
        XCTAssertFalse(conyMilk.isEqualExpirationDate())
    }

}
