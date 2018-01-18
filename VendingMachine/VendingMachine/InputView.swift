//
//  InputView.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class InputView {
    private var coins: Int
    private var vendingMachine: VendingMachine
    private var outputView: OutputView
    private var availableBeverage: [ObjectIdentifier:[Beverage]]
    init(vendingMachine: VendingMachine) {
        coins = 0
        self.vendingMachine = vendingMachine
        self.outputView = OutputView()
        availableBeverage = [ObjectIdentifier:[Beverage]]()
    }
    
    func incrementCurrentCoins() {
        vendingMachine.putCoins(coins: self.coins)
        outputView.printCurrentCoins(coins: self.coins)
    }
    
    func getMenuInput() {
        if let inputFromUser = readLine() {
            var separatedValues = separateInputValues(input: inputFromUser)
            switch separatedValues[0] {
            case 1:
                self.coins = separatedValues[1]
            case 2:
                menuOfPurchaseBeverage(menuNumber: separatedValues[1])
            default: break
            }
        }
    }
    
    func menuOfInitial() {
        let entireInventory = vendingMachine.showEntireInventory()
        outputView.printBeverageMenu(entireInventory: entireInventory)
    }
    
    func menuOfPurchaseBeverage(menuNumber: Int) {
        do {
            let choiceBeverageKey = try getBeverageKey(menuNumber: menuNumber)
            let beverageInfo = availableBeverage[choiceBeverageKey]?.first
            outputView.printPurchaseBeverage(beverageInfo: beverageInfo)
            self.coins -= beverageInfo?.price ?? 0
            vendingMachine.putCoins(coins: self.coins)
            vendingMachine.buyBeverage(beverageName: choiceBeverageKey)
        }catch {
            print("get Beverage error")
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
    
    func separateInputValues(input: String) -> [Int] {
        return input.split(separator: " ").map({Int($0) ?? 0})
    }
    
    func menuOfAddAmount() {
        availableBeverage = vendingMachine.listOfDrinksAvailable()
        outputView.printAddAmoutMenu(availableBeverage: availableBeverage)
    }
    
}
