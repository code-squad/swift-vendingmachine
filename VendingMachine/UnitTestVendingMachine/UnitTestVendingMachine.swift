//
//  UnitTestVendingMachine.swift
//  UnitTestVendingMachine
//
//  Created by 김지나 on 04/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {
    func testValidate() {
        let date = Date()
        XCTAssertTrue(Beverage.validate(expireDate:date + 432000))
    }
    
    func testPassValidate() {
        let date = Date()
        XCTAssertFalse(Beverage.validate(expireDate:date - 432000))
    }
    
    ///Milk
    func testMilkGradeA() {
        let milk = Milk(grade: .A, brand: "빙그레", volume: 240, price: 1000, productName: "빙그레딸기우유")
        XCTAssertTrue(milk.isGradeA())
    }
    
    func testMilkGradeB() {
        let milk = Milk(grade: .B, brand: "오뚜기", volume: 240, price: 1000, productName: "딸기우유")
        XCTAssertFalse(milk.isGradeA())
    }
    
    ///Soda
    func testCalorieIsHigh() {
        let soda = Soda(calorie: 500, brand: "cocacola", volume: 300, price: 2000, productName: "코카콜라")
        XCTAssertTrue(soda.isHigh())
    }
    
    func testCalorieIsNotHigh() {
        let soda = Soda(calorie: 200, brand: "cocacola", volume: 300, price: 2000, productName: "제로코카콜라")
        XCTAssertFalse(soda.isHigh())
    }
    
    ///Coffee
    func testHotCoffee() {
        let coffee = Coffee(ice: false, brand: "맥심", volume: 150, price: 1000, productName: "카누")
        XCTAssertTrue(coffee.isHot())
    }
    
    func testIceCoffee() {
        let coffee = Coffee(ice: true, brand: "맥심", volume: 150, price: 1000, productName: "카누")
        XCTAssertFalse(coffee.isHot())
    }
}
