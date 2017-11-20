//
//  OutputView.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Outputview {
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        return formatter
    }()

    func printMonitor(vendingMachine: VendingMachine) {
        let money = vendingMachine.howMuchRemainMoney()
        let monitorMessage = String(format: "현재 투입한 금액이 %@원입니다. 다음과 같은 음료가 있습니다.",
                                    numberFormatter.string(from: NSNumber(value: money))!)
        print(monitorMessage)
        var menu = ""
        if vendingMachine.howMuchRemainMoney() == 0 {
            menu += makeTotalMenu(of: vendingMachine)
        } else {
            menu += makeOnlyCanBuyMenu(of: vendingMachine)
        }
        print(menu)
    }

    func printPurchase(drink: Drink) {
        let purchaseMessage = String(format: "%@를 구매하셨습니다. %d원을 차감합니다.",
                                    drink.typeOfProduct,
                                    drink.price)
        print(purchaseMessage)
    }

    func printListOfAllPurchases(listOfPurchase: Array<(key: Drink, value: Count)>, change: Int) {
        var listOfAllPurchases = String(format: "잔돈은 %d원 입니다. 다음은 구매한 음료 목록입니다.\n",
                                        change)
        for index in 0..<listOfPurchase.count {
            let purchaseDrink = listOfPurchase[index]
            listOfAllPurchases += String(format: "%d)%@ (%d개)\n",
                                         index + 1,
                                         purchaseDrink.key.typeOfProduct,
                                         purchaseDrink.value)
        }
        listOfAllPurchases.removeLast()
        print(listOfAllPurchases)
    }

    private func makeTotalMenu(of vendingMachine: VendingMachine) -> String {
        var menu = "==>"
        let listOfInventory = vendingMachine.listOfInventory()
        for drink in listOfInventory {
            menu += String(format: " %@(%d개)", drink.key.typeOfProduct, drink.value)
        }
        return menu
    }

    private func makeOnlyCanBuyMenu(of vendingMachine: VendingMachine) -> String {
        var menu = ""
        let listOfCanBuy = vendingMachine.listOfCanBuy()
        for index in 0..<listOfCanBuy.count {
            let currentDrink = listOfCanBuy[index]
            menu += String(format: "%d)%@ %d원(%d개)\n",
                           index + 1,
                           currentDrink.key.typeOfProduct,
                           currentDrink.key.price,
                           currentDrink.value)
        }
        menu.removeLast()
        return menu
    }

}
