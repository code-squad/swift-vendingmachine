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
    
    /// 첫번째 메뉴 체크함수. 1,2,q 이외에는 닐
    static func checkFirstMenuInput(input:String)->InputView.FirstMenu?{
        switch input {
        case "1" : return InputView.FirstMenu.insertMoney
        case "2" : return InputView.FirstMenu.selectDrink
        case "q" : return InputView.FirstMenu.quit
        default : return nil
        }
    }
    
    /// 음료 종류 선택을 위한 체크함수, 1~maxDrinkNumber 까지 허용
    static func checkDrinkNumber(input:String)->InputView.DrinkNumber?{        
        switch input {
        case "1" : return InputView.DrinkNumber.one
        case "2" : return InputView.DrinkNumber.two
        case "3" : return InputView.DrinkNumber.three
        case "4" : return InputView.DrinkNumber.four
        case "5" : return InputView.DrinkNumber.five
        case "6" : return InputView.DrinkNumber.six
        default : return nil
        }
    }
}
