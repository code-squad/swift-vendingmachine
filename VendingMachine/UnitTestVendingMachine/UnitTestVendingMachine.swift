//
//  UnitTestVendingMachine.swift
//  UnitTestVendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {
    
    func test_자판기_음료수_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(Beverage(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactureDate: formatter.date(from: "20161009") ?? Date()))
    }
    
    func test_자판기_우유_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(Milk(brand: "서울우유", weight: 200, price: 1000, name: "날마다흰우유", manufactureDate: formatter.date(from: "20171012") ?? Date()))
    }
    
    func test_자판기_우유_유통기한_값확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let justMilk = StrawberryMilk(brand: "서울우유", weight: 100, price: 1200, name: "서울하얀우유", manufactureDate: formatter.date(from: "20171015") ?? Date())
        XCTAssertTrue(justMilk.expirationDate == formatter.date(from: "20171025") ?? Date())
    }
    
    func test_자판기_딸기우유_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(StrawberryMilk(brand: "서울우유", weight: 100, price: 1200, name: "서울딸기우유", manufactureDate: formatter.date(from: "20171015") ?? Date()))
    }
    
    func test_자판기_딸기우유_시럽함유량_값확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let strawberry = StrawberryMilk(brand: "서울우유", weight: 100, price: 1200, name: "서울딸기우유", manufactureDate: formatter.date(from: "20171015") ?? Date())
        XCTAssertTrue(strawberry.strawberrySyrup == 1)
    }
    
    func test_자판기_초코우유_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(ChocoMilk(brand: "매일우유", weight: 100, price: 1300, name: "매일초코우유", manufactureDate: formatter.date(from: "20171016") ?? Date()))
    }
    
    func test_자판기_초코우유_초코파우더함유량_값확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let chocoMilk = ChocoMilk(brand: "매일우유", weight: 100, price: 1300, name: "매일초코우유", manufactureDate: formatter.date(from: "20171016") ?? Date())
        XCTAssertTrue(chocoMilk.cocoaPowder == 1.1)
    }
    
    func test_자판기_바나나우유_객체만들기_성공() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        XCTAssertNotNil(BananaMilk(brand: "빙그레우유", weight: 100, price: 1500, name: "빙그레바나나우유", manufactureDate: formatter.date(from: "20171017") ?? Date()))
    }
    
    func test_자판기_바나나우유_바나나시럽함유량_값확인() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let bananaMilk = BananaMilk(brand: "빙그레우유", weight: 100, price: 1500, name: "빙그레바나나우유", manufactureDate: formatter.date(from: "20171017") ?? Date())
        XCTAssertTrue(bananaMilk.bananaSyrup == 1)
    }
    
}
