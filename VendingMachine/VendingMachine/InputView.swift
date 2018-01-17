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
    init(vendingMachine: VendingMachine) {
        coins = 0
        self.vendingMachine = vendingMachine
    }
    
    func usingVendingMachine() {
        let isContinue = true
        repeat {
            printCurrentCoins()
            printBeverageMenu()
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
                printCurrentCoins()
                menuOfAddAmount()
                printDoingMenu()
                getMenuInput()
            case 2: break
                
            default: break
            }
        }
    }
    
    func separateInputValues(input: String) -> [Int] {
        return input.split(separator: " ").map({Int($0) ?? 0})
    }
    
    func menuOfAddAmount() {
        let availableBeverage = vendingMachine.listOfDrinksAvailable(coins: coins)
        for (index, menu) in availableBeverage.enumerated() {
            print("\(index+1))\(menu.value[0].kindOf) \(menu.value[0].price)(\(menu.value.count)개)")
        }
    }
//    현재 투입한 금액이 10,000원입니다. 다음과 같은 음료가 있습니다.
//    1)딸기우유 1000원(3개)
//    2)바나나우유 1000원(2개)
//    3)팹시콜라 2000원(5개)
//    4)TOP커피 3000원(3개)
//    5)핫식스 1500원(4개)
//    1. 금액추가
//    2. 음료구매
//    > 2 1
//    딸기우유를 구매하셨습니다. 1000원을 차감합니다.
//    
//    현재 투입한 금액이 9,000원입니다. 다음과 같은 음료가 있습니다.
//    1)딸기우유 1000원(3개)
//    2)바나나우유 1000원(2개)
//    3)팹시콜라 2000원(5개)
//    4)TOP커피 3000원(3개)
//    5)핫식스 1500원(4개)
//    1. 금액추가
//    2. 음료구매
//    > 2 4
//    TOP커피를 구매하셨습니다. 3000원을 차감합니다.

}
