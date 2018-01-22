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
    
    // 초기 재고 설정
    let strawberryMilk: Beverage = StrawberryMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactureDate: formatter.date(from: "20171009") ?? Date(), strawberrySyrup: 5)
    let bananaMilk = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactureDate: formatter.date(from: "20171012") ?? Date(), bananaSyrup: 3)
    let coke = Coke(brand: "팹시", weight: 350, price: 2000, name: "다이어트콜라", manufactureDate: formatter.date(from: "20171005") ?? Date(), calorie: 25)
    let coffee = Top(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactureDate: formatter.date(from: "20171010") ?? Date(), isHotDrink: false)
    let isContinue = true
    var isAdminModeContinue = true
    var isUserModeContinue = true
    var isFirst = true
    
    let inputView = InputView()
    let outputView = OutputView()
    let userOutputView = UserOutputView()
    let adminOutputView = AdminOutputView()
    var vendingMachine = VendingMachine()
    var availableBeverage = [ObjectIdentifier:[Beverage]]()
    
    // 초기 재고 추가
    vendingMachine.addInInventory(beverageName: strawberryMilk, number: 2)
    vendingMachine.addInInventory(beverageName: bananaMilk, number: 1)
    vendingMachine.addInInventory(beverageName: coke, number: 1)
    vendingMachine.addInInventory(beverageName: coffee, number: 1)

    repeat {
        // 관리자, 사용자 선택 메뉴
        outputView.printMachineModeMenu()
        let mode = inputView.selectMachineMode()
        
        // 관리자 모드
        if mode == 1 {
            repeat {
                var entireInventory = vendingMachine.showEntireInventory()
                adminOutputView.printBeverageMenu(entireInventory: entireInventory)
                adminOutputView.printInventoryUseMenu()
                let inputValue = inputView.getMenuInput()
                let choiceBeverageName = adminOutputView.beverageFromMenuNumber(menuNumber: inputValue[1], availableBeverage: entireInventory)
                switch inputValue[0] {
                    case 1:
                        vendingMachine.addInInventory(beverageName: choiceBeverageName, number: inputValue[2])
                        adminOutputView.printAddInventory(choiceBeverage: choiceBeverageName, number: inputValue[2])
                    case 2:
                        vendingMachine.deleteInventory(beverageName: choiceBeverageName, number: inputValue[2])
                        adminOutputView.printDeleteInventory(choiceBeverage: choiceBeverageName, number: inputValue[2])
                    case -1:
                        isAdminModeContinue = false;
                    default: break
                }
                entireInventory = vendingMachine.showEntireInventory()
                adminOutputView.printBeverageMenu(entireInventory: entireInventory)
            } while isAdminModeContinue
        // 사용자 모드
        }else if mode == 2 {
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
    } while isContinue
}
run()
