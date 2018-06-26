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
var run = true
while run {
    outputView.showMessages(.start)
    outputView.showMessages(.mode)
    outputView.showInputLine()
    let mode = inputView.inputMode()
    
    switch mode {
    case 1:
        
    case 2:
        var customer = true
        while customer {
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
                customer = false
                run = false
            case .invalidMenu:
                outputView.showMessages(.invalidMenu)
            }
        }

    default: outputView.showMessages(.invalidMenu)
        continue
    }
    

}


