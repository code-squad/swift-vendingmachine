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
    func mainMenu(){
        print("자판기 메인메뉴 입니다.")
    }
    /// 자판기 금액을 리턴한다
    func printMoney(money:Int){
        print("현재 자판기에 입력된 금액은 \(money)원 입니다.")
    }
    
    /// 재고 출력 메세지
    func printGettableDrink(drinks:[InventoryDetail?]){
        // 메뉴번호를 출력하기 위한 변수
        var menuNumber = 1
        print("---현재 구매가능한 음료수---")
        for drink in drinks {
            if drink != nil {
            print("\(menuNumber). \(drink!.getDrinkName())-\(drink!.getDrinkPrice())원-\(drink!.getDrinkNumber())개")
            }
            else {
                print("\(menuNumber). 재고 없음")
            }
            menuNumber += 1 
        }
        print("----------------------")
    }
    
    /// 잘못된 금액 입력시 출력메세지
    func wrongMoney(){
        print( "잘못된 금액입니다.")
    }
    
    /// 잘못된 메뉴 선택시 출력메세지
    func wrongMenu(){
        print("잘못된 메뉴입니다")
    }
    
    /// 종료시 출력메세지
    func quitMessage(){
        print("자판기를 종료합니다.")
    }
    
    /// 재고가 없는 물건 주문시 출력메세지
    func notEnoughDrink(){
        print("음료 재고가 없습니다.")
    }
    
    /// 숫자를 입력해야되는데 숫자가 아닌경우
    func notNumeric(){
        print("정수가 아닙니다.")
    }
    
    /// 음료수 구매성공 메세지
    func buyingSuccessMessage(dirnkName:String,drinkNumber:Int,drinkPirce:Int){
        print("\(dirnkName) \(drinkNumber)개를 \(drinkPirce)원에 구매하였습니다.")
    }
}
