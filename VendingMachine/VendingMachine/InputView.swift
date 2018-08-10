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
    private func getUserInput() -> String {
        return readLine()!
    }
    
    /// 1차 메뉴. 돈추가, 음료수 선택지
    func firstMenu()->String{
        print("1. 돈 추가투입")
        print("2. 음료 선택")
        print("q. 종료")
        return getUserInput()
    }
    
    /// 돈 추가 선택시
    func insertMoney()->Int?{
        print("얼마를 투입하시겠습니까?")
        let money = getUserInput()
        return Checker.checkChangePlusInt(money)
    }
    /// 음료를 선택할경우 어떤 음료를 선택할지 묻는다
    func whichDrink()->String{
        print("어떤 음류수를 선택하시겠습니까?")
        return getUserInput()
    }
    
    /// 음료수를 선택할 경우 몇개를 구입할지 묻는다
    func howMany(drink:String)->Int?{
        print("\(drink) 를 몇개를 구입하시겟습니까?")
        let number = getUserInput()
        return Checker.checkChangePlusInt(number)
    }
}
