//
//  UserController.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class UserController {
    
    static func userMode(vendingMachine: VendingMachine) {
        var isFirst = true
        var isUserModeContinue = true
        let inputView = InputView()
        let userOutputView = UserOutputView()
        var vendingMachine = VendingMachine()
        
        var availableBeverage = [ObjectIdentifier:[Beverage]]()
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
                vendingMachine.buyBeverage(beverageKey: choiceBeverageKey)
            case -1:
                isUserModeContinue = false
            default: break
            }
        } while isUserModeContinue
    }
}
