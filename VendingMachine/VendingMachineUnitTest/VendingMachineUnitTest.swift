//
//  VendingMachineUnitTest.swift
//  VendingMachineUnitTest
//
//  Created by Elena on 26/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class VendingMachineUnitTest: XCTestCase {
    
    // Date로 String을 변경해서 나온 값과 동일한지 체크
    func test_Date_String_변경하는_함수_테스트_성공() {
        let nowDate = Date.changeString(beforeString: "20190101")
        let nowString = Date.changeDate(beforeDate: nowDate)
        
        XCTAssertTrue(nowString == "20190101")
    }
    
    // Date로 String을 변경해서 나온 값이 다른지 체크
    func test_Date_String_변경하는_함수_테스트_실패() {
        let nowString = Date.changeDate(beforeDate: Date())
        
        XCTAssertFalse(nowString == "20190101")
    }
    
    // String에서 Date로 변경해서 Date가 같은지 확인하기 하기
    func test_String_Date_변경하는_함수_테스트_성공() {
        let nowString = Date.changeDate(beforeDate: Date())
        let nowDate = Date.changeString(beforeString: nowString)

        XCTAssertTrue(Date.isEqualDate(manufacturedDate: nowDate))
    }
    
    // 5일뒤 날짜 확인하기
    func test_Date_5일이후_날짜_확인() {
        let nowDate = Date.changeString(beforeString: "20190101")
        let afterDate = Date.addDate(addDay: 5, day: nowDate)
        let endDate = Date.changeString(beforeString: "20190106")
        
        XCTAssertTrue(afterDate == endDate)
    }

    // description 값이 들어가는지 체크
    func test_check_Description() {
        let starbucksCoffee = StarbucksCoffee()
        
        XCTAssertNotNil(starbucksCoffee)
    }
    
    
}
