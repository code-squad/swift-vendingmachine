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
        guard let number = Int(orderDrinkNumber), number > 0, number <= inventoryDetail.storedDrinksDetail.count else {
            throw OutputView.errorMessage.wrongMenu        }
        return number
    }
    
    /// 사용자 메뉴 체크함수. 1,2,q 이외에는 닐
    static func checkUserFirstMenuInput(input:String)->InputView.UserFirstMenu{
        switch input {
        case "1" : return .insertMoney
        case "2" : return .selectDrink
        case "q" : return .quit
        default : return .none
        }
    }
    
    /// 관리자 메뉴 체크함수. 1,2,q 이외에는 닐
    static func checkAdminFirstMenuInput(input:String)->InputView.AdminFirstMenu{
        switch input {
        case "1" : return .addDrink
        case "2" : return .removeDrink
        case "q" : return .quit
        default : return .none
        }
    }
    
    /// 모드선택메뉴 체크함수. 1,2,q 이외에는 닐
    static func checkModeSelectMenuInput(input:String)->InputView.ModeSelectMenu{
        switch input {
        case "1" : return .admin
        case "2" : return .user
        case "q" : return .quit
        default : return .none
        }
    }
}
