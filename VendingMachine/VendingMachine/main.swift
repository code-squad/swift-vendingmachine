//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation
// - MARK: - Set Up
let inventory = Inventory(products: [ChocolateMilk(),
                                     StrawberryMilk(),
                                     Cola(),
                                     Americano(),
                                     Americano()])
var vendingMachine = VendingMachine(
    balance: Money(value: 0),
    inventory: inventory,
    history: History())

while vendingMachine.isOnSale {
    vendingMachine.handleMoney(OutputView.showBalance)
    vendingMachine.handleTupleList(OutputView.showStatistic)
    let inputString = InputView.fetchInput()
    do {
        let request = try Request.init(input: inputString)
        let order = StrategyFactory.create(request)
        vendingMachine.setStrategy(order)
        try vendingMachine.execute()
    } catch {
        let handler = ErrorHandler(error: error)
        handler.handle(logic: OutputView.showError)
    }
}
