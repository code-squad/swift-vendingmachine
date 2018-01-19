//
//  OutputView.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    private let vendingMachine: VendingMachine
    
    init(vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }
    
    func printResult(mode: InputView.Mode) {
        switch mode {
        case .insertMoney:
            insertMoney()
        case .buyBeverage:
            printResultOfBeveragePurchase()
        }
    }
    
    private func insertMoney() {
        vendingMachine.insertMoney(coin: .fiveHundred)
        print(vendingMachine.countChange())
    }
    
    private func printResultOfBeveragePurchase() {
        
    }
}
