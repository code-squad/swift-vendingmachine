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

    func printMonitor(mode: VendingMachineMode, money: Int, menu: [Drink], inventory: [Drink : Count]) {
        var menuString = ""
        menuString += moneyMessage(mode: mode, money: money)
        menuString += makeMenu(menu: menu, inventory: inventory)
        print(menuString)
        let order = makeOrder(mode: mode)
        print(order)
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

    private func moneyMessage(mode: VendingMachineMode, money: Int) -> String {
        var message = ""
        switch mode {
        case .manager:
            message = "총 수입은"
        case .user:
            message = "현재 투입한 금액은"
        }
        return "\(message) \(numberFormatter.string(from: NSNumber(value: money))!)원 입니다."
    }


    private func makeMenu(menu: [Drink], inventory: [Drink:Count]) -> String {
        var menuString = "다음과 같은 음료가 있습니다.\n"
        for drink in menu.enumerated() {
            let count = inventory[drink.element] ?? 0
            menuString += String(format: "%d)%@ %d원(%d개)\n",
                                 drink.offset + 1,
                                 drink.element.typeOfProduct,
                                 drink.element.price,
                                 count)
        }
        menuString.removeLast()
        return menuString
    }

    private func countDrinks(menu: [Drink]) -> [Drink : Count] {
        var countDictionary = [Drink : Count]()
        for drink in menu {
            if let drinkCount = countDictionary[drink] {
                countDictionary[drink] = drinkCount + 1
            }
            countDictionary[drink] = 0
        }
        return countDictionary
    }

    private func makeOrder(mode: VendingMachineMode) -> String {
        let orderMessage: String!
        switch mode {
        case .manager:
            orderMessage = "1. 재고추가\n2. 재고삭제\n3. 나가기"
        case .user:
            orderMessage = "1. 금액추가\n2. 음료구매\n3. 잔돈출금"
        }
        return orderMessage
    }

}
