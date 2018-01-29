//
//  UnitTestVendingMachine.swift
//  UnitTestVendingMachine
//
//  Created by YOUTH on 2018. 1. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {

    func testAttribute() {
        let strawberryMilk = Milk(flavor: "딸기", brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", MFDDate: "20171009")

        let result = strawberryMilk.isDecaf()
        XCTAssertEqual(result, true)
    }

    func testCurrentDate() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let result = formatter.string(from: date)
        print("!!!!!result : \(date)")

    }


    func testAddDate_DAY() {
        let date1 = MyDate(YYYYMMDD: "20171110")
        let today = date1.convertedDate
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let result = tomorrow ?? Date()
        let dateString = formatter.string(from: result)

        XCTAssertEqual(dateString, "20171111")
    }

    func testAddDate_MONTH() {
        let date1 = MyDate(YYYYMMDD: "20171110")
        let today = date1.convertedDate
        let tomorrow = Calendar.current.date(byAdding: .month, value: 3, to: today)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let result = tomorrow ?? Date()
        let dateString = formatter.string(from: result)

        XCTAssertEqual(dateString, "20180210")
    }

    func testAddDate_YEAR() {
        let date1 = MyDate(YYYYMMDD: "20171110")
        let today = date1.convertedDate
        let tomorrow = Calendar.current.date(byAdding: .year, value: 2, to: today)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let result = tomorrow ?? Date()
        let dateString = formatter.string(from: result)

        print(">>>> Add One Date <<<< : \(dateString)")
        XCTAssertEqual(dateString, "20191110")
    }

    func testExpiration_STRAWBERRYMILK() {
        let strawberryMilk = Milk(flavor: "딸기", brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", MFDDate: "20171009")

        XCTAssertEqual(false, strawberryMilk.isValid())
    }

    func testExpiration_BANANAMILK() {
        let bananaMilk = Milk(flavor: "바나나", brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", MFDDate: "20180125")
        XCTAssertEqual(true, bananaMilk.isValid())
    }

    func testExpiration_COKE() {
        let coke = SoftDrink(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", MFDDate: "20171005")
        XCTAssertEqual(true, coke.isValid())
    }

    func testExpiration_COFFEE() {
        let coffee = Coffee(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", MFDDate: "20171010")
        XCTAssertEqual(false, coffee.isValid())
    }

}

