//
//  OutputView.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 18..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class OutputView {
    private let vendingMachine: VendingMachine
    init(_ vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }
    
    func showResult(_ userInput: (behavior: InputView.InputMenu, specifiedInput: Int)?) {
        guard let userInput = userInput else { return }
        switch userInput.behavior {
        case .insert:
            guard let insertedCoin = MoneyManager.Unit(rawValue: userInput.specifiedInput) else { break }
            self.vendingMachine.insertMoney(insertedCoin)
        case .buy:
            guard 0 < userInput.specifiedInput && userInput.specifiedInput <= VendingMachine.Menu.allValues.count else { break }
            let selectedMenu = VendingMachine.Menu.allValues[userInput.specifiedInput-1]
            guard let purchasedBeverage = self.vendingMachine.popBeverage(selectedMenu) else { break }
            guard let purchasedMenu = VendingMachine.Menu(purchasedBeverage.description) else { break }
            print("\(purchasedMenu.rawValue) 음료를 구매하셨습니다. \(purchasedBeverage.price)원을 차감합니다.")
        }
    }
}
