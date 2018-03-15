//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var welchs = Welchs("톡쏘는정훈", 400, 1500, "웰치스", "20171105", 40, .grape)
var chocoFlavoredMilk = ChocoFlavoredMilk("달콤한정훈", 250, 1700, "맛좋은초코유유", "20180301", .second_Grade, 200, 1)
var top = Top("분위기있는정훈", 200, 1500, "TOP", "20171225", .grande, .basic)
var dutchCoffeeStory = DutchCoffeeStory("분위기있는정훈", 300, 3000, "더치커피스토리", "20171005", .short, .forGiftUse)
var beverages: [Beverage] = [chocoFlavoredMilk, top, dutchCoffeeStory, welchs]

var controller = Controller()
let outputView = Outputview()

beverages.forEach {
    controller.add(product: $0)
}
outputView.printMonitor(vendingMachine: controller)

while true {
    guard let input = InputView.readMenu() else {
        print("올바른 메뉴번호를 입력해주세요")
        continue
    }
    switch input.menuOption {
    case .putCoin:
        controller.add(money: input.detail)
    case .buyBeverage:
        do {
            let purchasedBeverage = try controller.buy(productIndex: input.detail)
             outputView.printPurchase(drink: purchasedBeverage)
        } catch let error as Controller.InGameMessage {
            print(error.rawValue)
        }
    case .withdrawlBalance:
        let balance = controller.withdrawlBalance()
        let shoppingHistory = controller.showShoppingHistory()
        outputView.printListOfAllPurchases(listOfPurchase: shoppingHistory, change: balance)
    }
    if input.menuOption == .withdrawlBalance { break }
    outputView.printMonitor(vendingMachine: controller)
}

