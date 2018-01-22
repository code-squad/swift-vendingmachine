//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func run() {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd"
    let isContinue = true
    var isFirst = true
    let inputView = InputView()
    let userOutputView = UserOutputView()
    var availableBeverage = [ObjectIdentifier:[Beverage]]()

    
    
    // 관리자 모드
    // 초기 재고 추가
    let strawberryMilk: Beverage = StrawberryMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactureDate: formatter.date(from: "20171009") ?? Date(), strawberrySyrup: 5)
    let bananaMilk = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactureDate: formatter.date(from: "20171012") ?? Date(), bananaSyrup: 3)
    let coke = Coke(brand: "팹시", weight: 350, price: 2000, name: "다이어트콜라", manufactureDate: formatter.date(from: "20171005") ?? Date(), calorie: 25)
    let coffee = Top(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactureDate: formatter.date(from: "20171010") ?? Date(), isHotDrink: false)
    
    var vendingMachine = VendingMachine()
    vendingMachine.addInInventory(beverage: strawberryMilk)
    vendingMachine.addInInventory(beverage: bananaMilk)
    vendingMachine.addInInventory(beverage: coke)
    vendingMachine.addInInventory(beverage: strawberryMilk)
    vendingMachine.addInInventory(beverage: coffee)
    
    // 사용자 모드
    // 메뉴 출력 및 사용자 입력
    repeat {
        
        // 현재 금액
        userOutputView.printCurrentCoins(coins: vendingMachine.coins)
        if isFirst {
            
            // 초기 메뉴
            let entireInventory = vendingMachine.showEntireInventory()
            userOutputView.printBeverageMenu(entireInventory: entireInventory)
            isFirst = false
        }else {
            
            // 이후 기본 메뉴
            availableBeverage = vendingMachine.listOfDrinksAvailable()
            userOutputView.printAddAmoutMenu(availableBeverage: availableBeverage)
        }
        
        // 메뉴 선택 및 이동
        userOutputView.printDoingMenu()
        let inputValue = inputView.getMenuInput()
        switch inputValue[0] {
            case 1:
                vendingMachine.putCoins(coins: inputValue[1])
            case 2:
                let choiceBeverageKey = userOutputView.menuOfPurchaseBeverage(menuNumber: inputValue[1], availableBeverage: availableBeverage)
                vendingMachine.buyBeverage(beverageName: choiceBeverageKey)
            default: break
        }
    } while isContinue
    
}
run()
