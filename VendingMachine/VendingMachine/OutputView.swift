//
//  OutputView.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class OutputView {
    func printAddAmoutMenu(availableBeverage: [ObjectIdentifier : [Beverage]]) {
        for (index, menu) in availableBeverage.enumerated() {
            print("\(index+1))\(menu.value[0].kindOf) \(menu.value[0].price)(\(menu.value.count)개)")
        }
    }
    
    func printPurchaseBeverage(beverageInfo: Beverage?) {
        print("\(beverageInfo?.kindOf ?? "")를 구매하셨습니다. \(beverageInfo?.price ?? 0)원을 차감합니다.")
    }
    
    func printCurrentCoins(coins: Int) {
        print("\n현재 투입한 금액이 \(coins)원입니다. 다음과 같은 음료가 있습니다.")
    }
    
    func printBeverageMenu(entireInventory: [ObjectIdentifier : [Beverage]]) {
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
}
