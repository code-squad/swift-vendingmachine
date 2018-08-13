//
//  OutputView.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    /// 시작 화면
    func mainMenu()->String{
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
            result += ("\(menuNumber). \(drink!.drinkName)-\(drink!.drinkPrice)원-\(drink!.drinkCount)개")
            }
            else {
                result += ("\(menuNumber). 재고 없음")
            }
            menuNumber += 1
            result += "\n"
        }
        result += ("----------------------")
        return result
    }
    
    /// 잘못된 금액 입력시 출력메세지
    func wrongMoney()->String{
        return( "잘못된 금액입니다.")
    }
    
    /// 잘못된 메뉴 선택시 출력메세지
    func wrongMenu()->String{
        return("잘못된 메뉴입니다")
    }
    
    /// 종료시 출력메세지
    func quitMessage()->String{
        return("자판기를 종료합니다.")
    }
    
    /// 재고가 없는 물건 주문시 출력메세지
    func notEnoughDrink()->String{
        return("음료 재고가 없습니다.")
    }
    
    /// 숫자를 입력해야되는데 숫자가 아닌경우
    func notNumeric()->String{
        return("정수가 아닙니다.")
    }
    
    /// 음료수 구매성공 메세지
    func buyingSuccessMessage(dirnkName:String,drinkCount:Int,drinkPirce:Int)->String{
        return("\(dirnkName) \(drinkCount)개를 \(drinkPirce)원에 구매하였습니다.")
    }
    /// 주문금액이 잔고보다 클 경우
    func notEnoughMoney()->String{
        return("잔액이 부족합니다.")
    }
    
    /// 1차 메뉴. 돈추가, 음료수 선택지
    func firstMenu()->String{
        var result = ""
        result += ("1. 돈 추가투입\n")
        result += ("2. 음료 선택\n")
        result += ("q. 종료\n")
        return result
    }
}
