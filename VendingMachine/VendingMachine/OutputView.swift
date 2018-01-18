//
//  OutputView.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class OutputView {
    private var coins: Int
    private var vendingMachine: VendingMachine
    private var availableBeverage: [ObjectIdentifier:[Beverage]]
    init(vendingMachine: VendingMachine) {
        coins = 0
        self.vendingMachine = vendingMachine
        availableBeverage = [ObjectIdentifier:[Beverage]]()
    }
    
    func printAddAmoutMenu() {
        self.availableBeverage = vendingMachine.listOfDrinksAvailable()
        for (index, menu) in availableBeverage.enumerated() {
            print("\(index+1))\(menu.value[0].kindOf) \(menu.value[0].price)(\(menu.value.count)개)")
        }
    }
    
    func printPurchaseBeverage(choiceBeverage: Beverage) {
        print("\(choiceBeverage.kindOf)를 구매하셨습니다. \(choiceBeverage.price)원을 차감합니다.")
        self.coins -= choiceBeverage.price
    }
    
    func printCurrentCoins() {
        print("\n현재 투입한 금액이 \(self.coins)원입니다. 다음과 같은 음료가 있습니다.")
        vendingMachine.putCoins(coins: coins)
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
    
    func inputValueClassification(separatedValues: [Int]) {
        switch separatedValues[0] {
            case 1:
                incrementCurrentCoins(coins: separatedValues[1])
            case 2:
                menuOfPurchaseBeverage(menuNumber: separatedValues[1])
            default: break
        }
    }
    
    func getBeverageKey(menuNumber: Int) throws -> ObjectIdentifier {
        for (index, beverage) in availableBeverage.enumerated() {
            if menuNumber == (index + 1) {
                return beverage.key
            }
        }
        throw InventoryBox.VendingMachinError.invalidBeverage
    }
    
    func menuOfPurchaseBeverage(menuNumber: Int) {
        do {
            let choiceBeverageKey = try getBeverageKey(menuNumber: menuNumber)
            if let choiceBeverage = availableBeverage[choiceBeverageKey]?.first {
                printPurchaseBeverage(choiceBeverage: choiceBeverage)
                vendingMachine.buyBeverage(beverageName: choiceBeverageKey)
            }
        }catch {
            print("get Beverage error")
        }
    }
    
    func incrementCurrentCoins(coins: Int) {
        self.coins = coins
    }
    
}
