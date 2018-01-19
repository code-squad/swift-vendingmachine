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
    
    func printResult(input: (InputView.Mode, Int)) throws {
        switch input.0 {
        case .insertMoney:
            insertMoney(coin: input.1)
        case .buyBeverage:
            try printResultOfBeveragePurchase(index: input.1)
        }
    }
    
    private func insertMoney(coin: Int) {
        vendingMachine.insertMoney(coin: coin)
    }
    
    private func printResultOfBeveragePurchase(index: Int) throws {
        let allMenus = BeverageMenu.allValues
        let beverageMenu = allMenus[index-1]
        let beverage = beverageMenu.makeInstance()
        try vendingMachine.buyBeverage(beverageMenu: beverageMenu)
        print("\(beverage.description)를 구매하셨습니다. \(beverage.price)원을 차감합니다.", terminator: "\n")
    }
}
