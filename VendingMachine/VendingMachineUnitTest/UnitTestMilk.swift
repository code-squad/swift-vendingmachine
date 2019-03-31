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
        XCTAssertNotNil(Milk(brand: "코니우유공장", volume: 500, price: 5000, name: "우유가너무좋아", manufacturedDate: Date.changeString(beforeDate: "10000101")))
    }
    
    func test_Milk_우유_핫_뜨거확인() {
        let conyMilk = Milk(brand: "코니우유공장", volume: 500, price: 5000, name: "불타는우유", manufacturedDate: Date())
        XCTAssertTrue(conyMilk.isHot())
    }
    
    func test_Milk_우유_아주차가운우유_차가운지_확인() {
        let conyMilk = Milk(brand: "코니우유공장", volume: 500, price: 5000, name: "아이스우유", manufacturedDate: Date(), hot: false)
        XCTAssertFalse(conyMilk.isHot())
    }
    
    func test_Milk_코니바나나우유_농장확인_OK() {
        let conyMilk = BananaMilk()
        XCTAssertTrue(conyMilk.isMilkFarmCode() == MilkFarmCode.Jejudo)
    }
    
    func test_Milk_코니바나나우유_농장확인_NO() {
        let conyMilk = BananaMilk()
        XCTAssertFalse(conyMilk.isMilkFarmCode() == MilkFarmCode.Seoul)
    }
    
    func test_Milk_코니우유_유통기한_확인_유통기한지나서_False() {
        let conyMilk = ChocolateMilk()
        XCTAssertFalse(conyMilk.isEqualExpirationDate(endDate: 1))
    }
    
    func test_Milk_코니커피_유통기한_확인_유통기한_안지났다_True() {
        let conyCoffee = ChocolateMilk()
        XCTAssertTrue(conyCoffee.isEqualExpirationDate(endDate: 965))
    }
}
