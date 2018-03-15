//
//  OutputView.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Outputview {
    func printMonitor(vendingMachine: Controller) {
        let money = vendingMachine.checkUserBalance()
        let monitorMessage = String(format: "잔액 : %d원이 있습니다. 구매가능한 음료는 다음과 같습니다.",
                                    money)
        print(monitorMessage)
        var menu = ""
        if vendingMachine.checkUserBalance() == 0 {
            menu += makeMenuOfTotal(of: vendingMachine)
        } else {
            menu += makeMenuOfBuyableBeverage(of: vendingMachine)
        }
        print(menu)
    }
    
    func printPurchase(drink: Beverage) {
        let purchaseMessage = String(format: "%@를 구매하셨습니다. %d원을 차감합니다.",
                                     drink.name,
                                     drink.price)
        print(purchaseMessage)
    }
    
    func printListOfAllPurchases(listOfPurchase: Array<(key: Beverage, value: Int)>, change: Int) {
        var listOfAllPurchases = String(format: "잔돈은 %d원 입니다. 다음은 구매한 음료 목록입니다.\n",
                                        change)
        for index in 0..<listOfPurchase.count {
            let purchaseDrink = listOfPurchase[index]
            listOfAllPurchases += String(format: "%d)%@ (%d개)\n",
                                         index + 1,
                                         purchaseDrink.key.name,
                                         purchaseDrink.value)
        }

        print(listOfAllPurchases)
    }
    
    private func makeMenuOfTotal(of controller: Controller) -> String {
        var menu = "🥫"
        let listOfInventory = controller.listOfInventory()
        for drink in listOfInventory {
            menu += String(format: "%@(%d개)", drink.key.name, drink.value)
        }
        return menu
    }
    
    private func makeMenuOfBuyableBeverage(of controller: Controller) -> String {
        var menu = ""
        let listOfCanBuy = controller.showListOfBuyableBeverage()
        for index in 0..<listOfCanBuy.count {
            let currentDrink = listOfCanBuy[index]
            menu += String(format: "%d) %@ %d원(%d개)\n",
                           index + 1,
                           currentDrink.key.name,
                           currentDrink.key.price,
                           currentDrink.value)
        }
    
        return menu
    }
    
}

