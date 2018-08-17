//
//  InputView.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    /// 사용자 입력을 받는다
    static private func getUserInput() -> String {
        return readLine()!
    }
    
    /// 1차 메뉴. 돈추가, 음료수 선택지
    enum FirstMenu{
        case
        insertMoney
        ,selectDrink
        ,quit
    }
    
    /// 첫번째 메뉴를 위한 입력을 받는다
    static func receiveFirstMenu() throws -> FirstMenu{
        guard let result = Checker.checkFirstMenuInput(input: getUserInput()) else {
            throw OutputView.errorMessage.wrongMenu
        }
        return result
    }
    
    /// 음료 종류를 선택하는 메뉴
    enum DrinkNumber : Int{
        case one=1,two,three,four,five,six
    }
    
    /// 음료 종류 선택을 위한 입력을 받는다
//    func receiveDrinkNumberMenu()->DrinkNumber?{
//        return Checker.checkDrinkNumber(input: InputView.getUserInput())
//    }
    
    /// 돈 추가 선택시
    static func insertMoney() throws ->Int{
        print("얼마를 투입하시겠습니까?")
        let money = getUserInput()
        // 입력값이 양의 정수인제 체크
        guard let result = Checker.checkChangePlusInt(money)  else {
            throw OutputView.errorMessage.notNumeric
        }
        return result
    }
    
    /// 음료수를 선택할 경우 몇개를 구입할지 묻는다
    static func howMany(drink:String) throws ->Int{
        print("\(drink) 를 몇개를 구입하시겟습니까?")
        let number = getUserInput()
        guard let result = Checker.checkChangePlusInt(number) else {
            throw OutputView.errorMessage.notNumeric
        }
        return result
    }
    
    /// 음료를 선택할경우 어떤 음료를 선택할지 묻는다
    static func whichDrink()->String{
        print("어떤 음류수를 선택하시겠습니까?")
        return getUserInput()
    }
}
