//
//  InputView.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class InputView {
    var coins: Int
    var vendingMachine: VendingMachine
    var availableBeverage: [ObjectIdentifier:[Beverage]]
    init(vendingMachine: VendingMachine) {
        coins = 0
        self.vendingMachine = vendingMachine
        availableBeverage = [ObjectIdentifier:[Beverage]]()
    }
    
    func usingVendingMachine() {
        let isContinue = true
        var isFirst = true
        repeat {
            printCurrentCoins()
            if isFirst {
                printBeverageMenu()
                isFirst = false
            }else {
                menuOfAddAmount()
            }
            printDoingMenu()
            getMenuInput()
        }while isContinue
    }
    
    func printCurrentCoins() {
        print("\n현재 투입한 금액이 \(self.coins)원입니다. 다음과 같은 음료가 있습니다.")
    }

    func printBeverageMenu() {
        let entireInventory = vendingMachine.showEntireInventory()
        for menu in entireInventory {
            let numberOfBeverage = menu.value.count
            print("\(menu.value[0].kindOf)(\(numberOfBeverage)개) ", terminator: "")
        }
        print()
    }
    
    func printDoingMenu() {
        print("1. 금액추가")
        print("2. 음료구매")
        print("> ", terminator: "")
    }
    
    func getMenuInput() {
        if let inputFromUser = readLine() {
            var separatedValues = separateInputValues(input: inputFromUser)
            switch separatedValues[0] {
            case 1:
                self.coins = separatedValues[1]
                
            case 2:
                printPurchaseBeverage(menuNumber: separatedValues[1])
            default: break
            }
        }
    }
    
    func printPurchaseBeverage(menuNumber: Int) {
        do {
            let choiceBeverageKey = try getMenuInfo(menuNumber: menuNumber)
            let beverageInfo = availableBeverage[choiceBeverageKey]?.first
            print("\(beverageInfo?.kindOf ?? "")를 구매하셨습니다. \(beverageInfo?.price ?? 0)원을 차감합니다.")
            self.coins -= beverageInfo?.price ?? 0
            vendingMachine.buyBeverage(beverageName: choiceBeverageKey)
        }catch {
            print("get Beverage error")
        }
    }
    
    func getMenuInfo(menuNumber: Int) throws -> ObjectIdentifier {
        for (index, beverage) in availableBeverage.enumerated() {
            if menuNumber == (index + 1) {
                return beverage.key
            }
        }
        throw InventoryBox.VendingMachinError.invalidBeverage
    }
    
    func separateInputValues(input: String) -> [Int] {
        return input.split(separator: " ").map({Int($0) ?? 0})
    }
    
    func menuOfAddAmount() {
        availableBeverage = vendingMachine.listOfDrinksAvailable(coins: coins)
        for (index, menu) in availableBeverage.enumerated() {
            print("\(index+1))\(menu.value[0].kindOf) \(menu.value[0].price)(\(menu.value.count)개)")
        }
    }
    
}
