//
//  Checker.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Checker {
    /// 제공하는 음료의 종류 가지수
    static let maxDrinkNumber = 6
    
    /// 문자열을 받아서 양의 정수로 치환 가능한지 체크. 가능하면 치환, 안되면 닐 리턴
    static func checkChangePlusInt(_ text:String)->Int?{
        guard let number = Int(text) else {
            return nil
        }
        guard number > 0 else {
            return nil
        }
        return number
    }
    
    /// 문자열을 받아서 숫자 1~maxDrinkNumber 사이인지 체크
    static func isRightDrinkNumber(_ text: String)->Int?{
        guard let number = Int(text), number > 0, number <= Checker.maxDrinkNumber else {
            return nil
        }
        return number
    }
    
    /// 첫번째 메뉴 체크함수. 1,2,q 이외에는 닐
    static func checkFirstMenuInput(input:String)->InputView.FirstMenu?{
        switch input {
        case "1" : return InputView.FirstMenu.insertMoney
        case "2" : return InputView.FirstMenu.selectDrink
        case "q" : return InputView.FirstMenu.quit
        default : return nil
        }
    }
    
}
