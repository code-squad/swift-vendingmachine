//
//  UserController.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 6. 28..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct UserController {
    
    private let vendingmachine: UserVendingmachine
    private let outputView: UserOutputView

    init(_ vendingmachine: UserVendingmachine,_ outputView: UserOutputView) {
        self.vendingmachine = vendingmachine
        self.outputView = outputView
    }
    
    private let beverageSet = BeverageFactory().setBeverage()
    private let inputView = InputView()
    
    //사용자모드
    mutating func runUserMode() {
        var user = true
        while user {
            outputView.showMessagesSet(coin)
            let menu = inputView.inputMenu()
            switch menu {
            case .inputCoin:
                addInputCoin()
            case .purchasesBeverage:
                buyBeverage()
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
    
    //금액 추가
    private mutating func addInputCoin() {
        outputView.showMessages(.addMoney)
        let coin = inputView.inputCoin()
        vendingmachine.addBalance(coin)
    }
    
    //음료 구매
    private func buyBeverage() {
        var buy = true
        while buy {
            let balance = vendingmachine.checkBalance()
            if balance < 1000 {
                outputView.showMessages(.invalidBalance)
                buy = false
                continue
            }
            outputView.showMessages(.chooseBeverage)
            let kindOfBeverage = outputView.showBeveragesList()
            let inputNumber = inputView.inputNumberOfBeverage()
            let range = vendingmachine.makeKindOfBeverage().count
            let kind = kindOfBeverage[inputNumber-1]
            guard inputNumber <= range else { outputView.showMessages(.invalidMenu)
                continue }
            let price = vendingmachine.makePriceOfBeverage(kind)
            guard price < balance else { outputView.showMessages(.lowBalance)
                continue }
            vendingmachine.buyBeverage(kind)
            outputView.showPurchases(kind, price)
            buy = false
        }
    }
    
}
