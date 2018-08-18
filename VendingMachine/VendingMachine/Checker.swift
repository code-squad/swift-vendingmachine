//
//  Checker.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Checker {
    
    /// 문자열을 받아서 양의 정수로 치환 가능한지 체크. 가능하면 치환, 안되면 닐 리턴
    static func checkChangePlusInt(_ text:String)->Int?{
        guard let number = Int(text),number > 0 else {
            return nil
        }
        return number
    }
    
    /// 문자열을 받아서 재고메뉴번호 범위인지 체크
    static func isRightDrinkNumber(orderDrinkNumber: String,inventoryDetail:InventoryDetail)throws->Int{
        guard let number = Int(orderDrinkNumber), number > 0, number <= inventoryDetail.storedDrinksDetail.count+1 else {
            throw OutputView.errorMessage.wrongMenu        }
        return number
    }
    
    /// 사용자 메뉴 체크함수. 1,2,q 이외에는 닐
    static func checkUserFirstMenuInput(input:String)->InputView.UserFirstMenu?{
        switch input {
        case "1" : return InputView.UserFirstMenu.insertMoney
        case "2" : return InputView.UserFirstMenu.selectDrink
        case "q" : return InputView.UserFirstMenu.quit
        default : return nil
        }
    }
    
    /// 관리자 메뉴 체크함수. 1,2,q 이외에는 닐
    static func checkAdminFirstMenuInput(input:String)->InputView.AdminFirstMenu?{
        switch input {
        case "1" : return InputView.AdminFirstMenu.addDrink
        case "2" : return InputView.AdminFirstMenu.removeDrink
        case "q" : return InputView.AdminFirstMenu.quit
        default : return nil
        }
    }
    
    /// 모드선택메뉴 체크함수. 1,2,q 이외에는 닐
    static func checkModeSelectMenuInput(input:String)->InputView.ModeSelectMenu?{
        switch input {
        case "1" : return InputView.ModeSelectMenu.admin
        case "2" : return InputView.ModeSelectMenu.user
        case "q" : return InputView.ModeSelectMenu.quit
        default : return nil
        }
    }
}
