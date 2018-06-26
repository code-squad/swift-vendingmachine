//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let expirationDate = DateFormatter()
expirationDate.dateFormat = "yyyyMMdd"

let beverageSet = BeverageFactory().setBeverage()
var vendingMachine = Vendingmachine.init(beverageSet)
let outputView = OutputView(vendingMachine)
let inputView = InputView()


var coin = vendingMachine.checkBalance()
vendingMachine.addBalance(coin)

//사용자모드
func runUserMode() {
    var user = true
    while user {
        outputView.showMessagesSet(coin)
        let menu = inputView.inputMenu()
        switch menu {
        case .inputCoin:
            outputView.showMessages(.addMoney)
            coin = inputView.inputCoin()
            vendingMachine.addBalance(coin)
        case .purchasesBeverage:
            let balance = vendingMachine.checkBalance()
            if balance < 1000 {
                outputView.showMessages(.invalidBalance)
                continue
            }
            outputView.showMessages(.chooseBeverage)
            let kindOfBeverage = outputView.showBeveragesList()
            let inputNumber = inputView.inputNumberOfBeverage()
            let range = vendingMachine.makeKindOfBeverage().count
            let kind = kindOfBeverage[inputNumber-1]
            guard inputNumber <= range else { outputView.showMessages(.invalidMenu)
                continue }
            let price = vendingMachine.makePriceOfBeverage(kind)
            guard price < balance else { outputView.showMessages(.lowBalance)
                continue }
            vendingMachine.buyBeverage(kind)
            outputView.showPurchases(kind, price)
        case .showPurchases:
            outputView.showPurchasesList()
        case .exit:
            outputView.showMessages(.exit)
            user = false
            run = false
        case .invalidMenu:
            outputView.showMessages(.invalidMenu)
        }
    }
}

//관리자모드
func runAdminMode() {
    outputView.showMessages(.controlInventory)
    outputView.showInputLine()
    let controlNumber = inputView.inputControlNumber()
    let kindDictionary = ["칸타타": Cantata(), "딸기우유": StrawberryMilk(), "팹시콜라": Coke(), "초코우유": ChocoMilk(), "티오피": Top(), "스프라이트": Sprite(), "바나나우유": BananaMilk(), "조지아": Georgia(), "환타": Fanta()]
    var admin = true
//    while admin {
        switch controlNumber {
        case 1:
            outputView.showMessages(.addInventory)
            let kindOfBeverage = outputView.showInventoryList()
            let inputNumber = inputView.inputNumberOfBeverage()
            
            let kind = kindOfBeverage[inputNumber-1]
            if let beverageInstance = kindDictionary[kind] {
                vendingMachine.addPurchases(beverageInstance)
            }
            outputView.showInventoryList()
            
        case 2:
            outputView.showMessages(.removeInventory)
        default:
            outputView.showMessages(.invalidMenu)
//            continue
            
        }
//    }

}


var run = true
while run {
    outputView.showMessages(.start)
    outputView.showMessages(.mode)
    outputView.showInputLine()
    let mode = inputView.inputMode()
    switch mode {
    case 1:
        runAdminMode()
    case 2:
        runUserMode()
    default: outputView.showMessages(.invalidMenu)
        continue
    }
}




