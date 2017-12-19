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
    
    func showResult(_ userInput: (behavior: InputView.InputMenu, specifiedInput: Int)) {
        switch userInput.behavior {
        case .insert: showInsertResult(userInput.specifiedInput)
        case .buy: showBuyResult(userInput.specifiedInput)
        }
    }

    private func showInsertResult(_ userInput: Int) {
        guard let insertedCoin = MoneyManager.Unit(rawValue: userInput) else { return }
        self.vendingMachine.insertMoney(insertedCoin)
    }

    private func showBuyResult(_ userInput: Int) {
        guard 0 < userInput && userInput <= VendingMachine.Menu.allValues.count else { return }
        let selectedMenu = VendingMachine.Menu.allValues[userInput-1]
        guard let purchasedBeverage = self.vendingMachine.popBeverage(selectedMenu) else { return }
        guard let purchasedMenu = VendingMachine.Menu(purchasedBeverage.description) else { return }
        print("\(purchasedMenu.rawValue) 음료를 구매하셨습니다. \(purchasedBeverage.price)원을 차감합니다.")
    }

}
