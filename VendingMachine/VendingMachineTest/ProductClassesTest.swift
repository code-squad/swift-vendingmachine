//
//  VendingMachineTest.swift
//  VendingMachineTest
//
//  Created by jang gukjin on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class ProductClassesTest: XCTestCase {
    
    /// 유통기한이 지났는지 테스트 (현재 날짜 기준)
    func testValidate() {
        let pastedExpirationDate = StrawberryMilk(stringDate: "20190630", strawberryContent: 20)
        let notPastedExpirationDate = StrawberryMilk(stringDate: "22000706", strawberryContent: 20)
        
        XCTAssertTrue(notPastedExpirationDate.validate())
        XCTAssertFalse(pastedExpirationDate.validate())
    }
    
    /// 저칼로리인지 테스트 (100칼로리 이하면 저칼로리)
    func testSodaisLowCalorie() {
        let coke = Coke(calorie: 200, sugarFree: false)
        let sprite = Sprite(calorie: 90, lemonContent: 5.0)
        
        XCTAssertTrue(sprite.isLowCalorie())
        XCTAssertFalse(coke.isLowCalorie())
    }
    
    /// 뜨거운음료인지 테스트 (60.0도 이상이면 뜨거운 음료)
    func testCoffeeisHot() {
        let top = TOPCoffee(temperature: 70.0, arbicaBeansContent: true)
        let cantata = CantataCoffee(temperature: 30.0, DripStatus: true)
        
        XCTAssertTrue(top.isHot())
        XCTAssertFalse(cantata.isHot())
    }
    
    /// DateUtil의 역할을 잘 수행하는지 테스트 (String타입과 Date타입으로 잘 변화시키는지 테스트)
    func testDateUtil() {
        let date = DateUtil.convertDate(of: "20190708")
        let dateToString = DateUtil.convertText(of: date)
        
        XCTAssertTrue(date is Date)
        XCTAssertTrue(dateToString is String)
    }
}
