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
    private func getUserInput(_ requestMessage:String) -> String {
        if requestMessage.count > 0 {
            print(requestMessage)            
        }
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
    /// 사용자 메뉴 체크함수. 1,2,q 이외에는 닐
    func changeUserFirstMenuInput(input:String)->InputView.UserFirstMenu{
        switch input {
        case "1" : return .insertMoney
        case "2" : return .selectDrink
        case "q" : return .quit
        default : return .none
        }
    }
    
    /// 관리자 메뉴 체크함수. 1,2,q 이외에는 닐
    func changeAdminFirstMenuInput(input:String)->InputView.AdminFirstMenu{
        switch input {
        case "1" : return .addDrink
        case "2" : return .removeDrink
        case "q" : return .quit
        default : return .none
        }
    }
    
    /// 사용자용 첫번째 메뉴를 위한 입력을 받는다
     func receiveUserFirstMenu()-> UserFirstMenu{
        return changeUserFirstMenuInput(input: getUserInput(""))
    }
    
    /// 관리자용 첫번째 메뉴를 위한 입력을 받는다
     func receiveAdminFirstMenu()-> AdminFirstMenu{
        return changeAdminFirstMenuInput(input: getUserInput(""))        
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
     func receiveModeSelectMenu() -> ModeSelectMenu{
        return Checker.checkModeSelectMenuInput(input: getUserInput(""))
    }
    
    /// 돈 추가 선택시
     func insertMoney() throws ->Int{
        let money = getUserInput("얼마를 투입하시겠습니까?")
        // 입력값이 양의 정수인제 체크
        guard let result = Checker.checkChangePlusInt(money) else {
            throw OutputView.errorMessage.notNumeric
        }
        return result
    }
    
    /// 음료수를 선택할 경우 몇개를 구입할지 묻는다
     func howMany(drink:String) throws ->Int{
        let number = getUserInput("\(drink) 개수를 입력해 주십시요")
        guard let result = Checker.checkChangePlusInt(number) else {
            throw OutputView.errorMessage.notNumeric
        }
        return result
    }
    
    /// 음료를 선택할경우 어떤 음료를 선택할지 묻는다
     func whichDrink()throws->Int{
        let userInput = getUserInput("어떤 음류수를 선택하시겠습니까?")
        guard let number = Int(userInput),number > 0 else {
            throw OutputView.errorMessage.wrongMenu
        }
        return number
    }
    
    
}
