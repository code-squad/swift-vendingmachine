//
//  VedingMachineTests.swift
//  VedingMachineTests
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class VedingMachineTests: XCTestCase {
    func test_코카콜라_인스턴스_생성() {
        let today = DateUtility.today()
        let cocaCola = CocaCola(brand: "코카콜라", volume: 350, price: 2000, productName: "다이어트콜라", expiryDate: today, calorie: 100, carbonicAcid: "탄산낮음")
        XCTAssertTrue(cocaCola.isLowCalorie())
    }

    func test_펩시_인스턴스_생성() {
        let today = DateUtility.today()
        let pepci = Pepci(brand: "펩시", volume: 350, price: 2000, productName: "펩시", expiryDate: today, calorie: 250, carbonicAcid: "탄산높음")
        XCTAssertFalse(pepci.isLowCalorie())
    }
    
    func test_딸기우유_인스턴스_생성() {
        let today = DateUtility.today()
        let strawberryMilk = StrawberryMilk(brand: "서울우유", volume: 200, price: 1000, productName: "날마다딸기우유", expiryDate: today, calorie: 250, fatRate: 40)
        XCTAssertFalse(strawberryMilk.isLowFat())
    }
    
    func test_바나나우유_인스턴스_생성() {
        let today = DateUtility.today()
        let bananaMilk = BananaMilk(brand: "서울우유", volume: 200, price: 1000, productName: "날마다바나나우유", expiryDate: today, calorie: 250, fatRate: 20)
        XCTAssertTrue(bananaMilk.isLowFat())
    }
    
    func test_조지아커피_인스턴스_생성() {
        let today = DateUtility.today()
        let georgia = Georgia(brand: "조지아커피", volume: 150, price: 1000, productName: "조지아 아메리카노", expiryDate: today, calorie: 250, temperature: 90)
        XCTAssertTrue(georgia.isHot())
    }
    
}
