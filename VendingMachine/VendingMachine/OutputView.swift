//
//  OutputView.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Outputview {
    func printMonitor(mode: Controller.Mode, money: Int, menu: [Beverage], inventory: [Beverage:Int]) {
        var menuString = ""
        menuString += moneyMessage(mode, money)
        menuString += makeMenu(menu, inventory)
        print(menuString)
        let order = makeOrder(mode: mode)
        print(order)
    }
    
    func printPurchase(drink: Beverage) {
        let purchaseMessage = String(format: "%@를 구매하셨습니다. %d원을 차감합니다.",
                                     drink.name,
                                     drink.price)
        print(purchaseMessage)
    }
    
    func printListOfAllPurchases(listOfPurchase: [Beverage], change: Int) {
        var listOfAllPurchases = String(format: "잔돈은 %d원 입니다. 다음은 구매한 음료 목록입니다.\n",
                                        change)
        let countDictionary = makeDrinkCount(listOfPurchase: listOfPurchase)
        for drink in countDictionary.enumerated() {
            listOfAllPurchases += String(format: "%d)%@ (%d개)\n",
                                         drink.offset+1,
                                         drink.element.key.name,
                                         drink.element.value)
        }
        listOfAllPurchases.removeLast()
        print(listOfAllPurchases)
    }
    
    private func makeDrinkCount(listOfPurchase: [Beverage]) -> [Beverage:Int] {
        var countDictionary = [Beverage:Int]()
        listOfPurchase.forEach {
            let count = countDictionary[$0] ?? 0
            countDictionary[$0] = count + 1
        }
        return countDictionary
    }
    
    private func moneyMessage(_ mode: Controller.Mode, _ money: Int) -> String {
        var message = ""
        switch mode {
        case .admin:
            message = "총 수입은"
        case .user:
            message = "현재 투입한 금액은"
        }
        return "\(message) \(money)원 입니다."
    }
    
    
    private func makeMenu(_ menu: [Beverage], _ inventory: [Beverage:Int]) -> String {
        var menuString = "다음과 같은 음료가 있습니다.\n"
        for drink in menu.enumerated() {
            let count = inventory[drink.element] ?? 0
            menuString += String(format: "%d)%@ %d원(%d개)\n",
                                 drink.offset + 1,
                                 drink.element.name,
                                 drink.element.price,
                                 count)
        }
        menuString.removeLast()
        return menuString
    }
    
    private func makeOrder(mode: Controller.Mode) -> String {
        let orderMessage: String!
        switch mode {
        case .admin:
            orderMessage = "1. 재고추가\n2. 재고삭제\n3. 나가기"
        case .user:
            orderMessage = "1. 금액추가\n2. 음료구매\n3. 잔돈출금"
        }
        return orderMessage
    }
}
