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
let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20160301", .second_Grade, 72, 0.7)
var beverages: [Beverage] = [chocoFlavoredMilk, top, dutchCoffeeStory, welchs, bananaFlavord]

var controller = Controller()
beverages.forEach {
    controller.add(product: $0)
}
let outputView = Outputview()
outputView.printMonitor()
while true {
    guard let input = InputView.readMenu() else {
        print("올바른 메뉴번호를 입력해주세요")
        continue
    }
    switch input.menuOption {
    case .putCoin:
        controller.add(money: input.detail)
    case .buyBeverage:
        let purchasedBeverage = controller.buy(productIndex: input.detail)
        guard let beverage = purchasedBeverage else {
            print ("올바른 음료번호를 입력해주세요.")
            continue
        }
        outputView.printPurchase(beverage)
    case .withdrawlBalance:
        outputView.printListOfAllPurchases()
    }
    if input.menuOption == .withdrawlBalance { break }
    outputView.printMonitor()
    
}

