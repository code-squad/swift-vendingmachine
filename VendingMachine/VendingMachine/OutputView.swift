//
//  OutputView.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Outputview {
    private var controller : Controller
    init(_ controller: Controller) {
        self.controller = controller
    }
    func printMonitor() {
        let monitorMessage = String(format: "잔액 : %d원, 구매가능한 음료는 아래와 같습니다.",
                                    controller.checkUserBalance())
        print(monitorMessage)
        var menu = ""
        if controller.checkUserBalance() == 0 {
            menu += makeMenuOfTotal()
        } else {
            menu += makeMenuOfBuyableBeverage()
        }
        print(menu)
    }
    
    func printPurchase(_ beverage: Beverage) {
        let purchaseMessage = String(format: "%@를 구매하셨습니다. %d원을 차감합니다.", beverage.name, beverage.price)
        print(purchaseMessage)
    }
    
    func printListOfAllPurchases() {
        let balance = controller.withdrawlBalance()
        let shoppingHistory = controller.showShoppingHistory()
        var listOfAllPurchases = String(format: "잔돈은 %d원 입니다. 다음은 구매한 음료 목록입니다.\n",
                                                                        balance)
        for index in 0..<shoppingHistory.count {
            let purchaseDrink = shoppingHistory[index]
            listOfAllPurchases += String(format: "%d)%@ (%d개)\n",
                                                                      index + 1,
                                                                      purchaseDrink.key.name,
                                                                      purchaseDrink.value)
        }
        print(listOfAllPurchases)
    }
    
    private func makeMenuOfTotal() -> String {
        var menu = "🥫"
        let listOfInventory = self.controller.listOfInventory()
        for drink in listOfInventory {
            menu += String(format: "%@(%d개)", drink.key.name, drink.value)
        }
        return menu
    }
    
    private func makeMenuOfBuyableBeverage() -> String {
        var menu = ""
        let listOfCanBuy = self.controller.showListOfBuyableBeverage()
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

