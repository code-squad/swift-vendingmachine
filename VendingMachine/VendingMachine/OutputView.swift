//
//  OutputView.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    /// 문자열을 받아서 출력한다
    func printMessage(message:String){
        print (message)
    }
    
    /// 에러 출력 메세지들
    enum errorMessage : String {
        case wrongMoney = "잘못된 금액입니다."
        case wrongMenu = "잘못된 메뉴입니다."
        case quitMessage = "자판기를 종료합니다."
        case notEnoughDrink = "음료 재고가 부족합니다"
        case notNumeric = "잘못된 수 입니다."
        case notEnoughMoney = "입력된 금액이 부족합니다."
    }
    
    /// 시작 화면
    func welcomMessage()->String{
        return("자판기 메인메뉴 입니다.")
    }
    /// 자판기 금액을 리턴한다
    func returnMoney(money:Int)->String{
        return("현재 자판기에 입력된 금액은 \(money)원 입니다.")
    }
    
    /// 재고 출력 메세지
    func returnGettableDrink(drinks:[InventoryDetail?])->String{
        // 결과출력을 위한 변수
        var result = ""
        // 메뉴번호를 출력하기 위한 변수
        var menuNumber = 1
        result += ("---현재 구매가능한 음료수---\n")
        for drink in drinks {
            if drink != nil {
                result += ("\(menuNumber). \(drink!.drinkName)-\(drink!.drinkPrice)원-\(drink!.drinkCount)개\n")
            }
            else {
            }
            menuNumber += 1
        }
        result += ("----------------------")
        return result
    }
    
    /// 음료수 구매성공 메세지
    func buyingSuccessMessage(drinkName:String,drinkCount:Int,drinkPrice:Int)->String{
        return("\(drinkName) \(drinkCount)개를 \(drinkPrice)원에 구매하였습니다.")
    }
    /// 재고정보를 받아서 구매성공메세지를 리턴하는 같은 함수
    func buyingSuccessMessage(drinkDetail:InventoryDetail)->String{
        return("\(drinkDetail.drinkName) \(drinkDetail.drinkCount)개를 \(drinkDetail.drinkCount * drinkDetail.drinkPrice)원에 구매하였습니다.")
    }
    
    /// 재고정보를 받아서 구매 결과를 표시. 성공 or 실패
    func buyingResult(drinkDetail:InventoryDetail?)->String{
        // 구매 성공시
        if let result = drinkDetail {
            return buyingSuccessMessage(drinkDetail: result)
        } // 구매실패시
        else {
            return OutputView.errorMessage.notEnoughDrink.rawValue
        }
    }
    
    /// 1차 메뉴. 돈추가, 음료수 선택지
    func firstMenu()->String{
        var result = ""
        result += ("1. 돈 추가투입\n")
        result += ("2. 음료 선택\n")
        result += ("q. 종료\n")
        return result
    }
    
    /// 음료를 선택할경우 어떤 음료를 선택할지 묻는다
    func whichDrink()->String{
        return("어떤 음류수를 선택하시겠습니까?")
    }
}
