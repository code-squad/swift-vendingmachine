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
    
    /// 사용자용 1차 메뉴. 돈추가, 음료수 선택지
    enum UserFirstMenu{
        case
        insertMoney
        ,selectDrink
        ,quit
        ,none
    }
    
    /// 관리자용 1차 메뉴. 돈추가, 음료수 선택지
    enum AdminFirstMenu{
        case
        addDrink
        ,removeDrink
        ,quit
        ,none
    }
    
    /// 사용자용 첫번째 메뉴를 위한 입력을 받는다
    static func receiveUserFirstMenu() -> UserFirstMenu{
        return Checker.checkUserFirstMenuInput(input: getUserInput())
    }
    
    /// 관리자용 첫번째 메뉴를 위한 입력을 받는다
    static func receiveAdminFirstMenu() -> AdminFirstMenu{
        return Checker.checkAdminFirstMenuInput(input: getUserInput())
    }
    
    /// 관리자, 사용자 선택메뉴
    enum ModeSelectMenu{
        case
        admin
        ,user
        ,quit
        ,none
    }
    
    /// 사용자용 첫번째 메뉴를 위한 입력을 받는다
    static func receiveModeSelectMenu() -> ModeSelectMenu{
        return Checker.checkModeSelectMenuInput(input: getUserInput())
    }
    
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
        print("\(drink) 개수를 입력해 주십시요")
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
