//
//  OutputView.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Outputview {
    func printMonitor(vendingMachine: VendingMachine) {
        let monitorMessage = String(format: "현재 투입한 금액이 %d원입니다. 다음과 같은 음료가 있습니다.",
                                    vendingMachine.howMuchRemainMoney())
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
                                    drink.productTpye,
                                    drink.price)
        print(purchaseMessage)
    }
    
    private func makeTotalMenu(of vendingMachine: VendingMachine) -> String {
        var menu = "==>"
        let listOfInventory = vendingMachine.listOfInventory()
        for drink in listOfInventory {
            menu += String(format: " %@(%d개)", drink.key.productTpye, drink.value)
        }
        return menu
    }
    
    private func makeOnlyCanBuyMenu(of vendingMachine: VendingMachine) -> String {
        var menu = ""
        let listOfCanBuy = vendingMachine.listOfCanBuy()
        var index = 1
        for drink in listOfCanBuy {
            menu += String(format: "%d)%@ %d원(%d개)\n",
                           index,
                           drink.key.productTpye,
                           drink.key.price,
                           drink.value)
            index += 1
        }
        menu.removeLast()
        return menu
    }
}
