//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation
// - MARK: - Set Up
let products = ProductFactory.createAll(quantity: 3)
let inventory = Inventory(products: products)
var vendingMachine = VendingMachine(balance: Money(value: 0),
                                    inventory: inventory,
                                    history: History())

while vendingMachine.isOnSale {
    let selectInputView = InputViewFactory.create(.none)
    let authorityIndex = Int(selectInputView.fetchInput())
    let authority = Authority(index: authorityIndex)
    
    guard
        authority != .none
        else { continue }
    
    vendingMachine.handleProductStatistic(OutputView.showStatistic)
    vendingMachine.handleMoney(OutputView.showBalance)
    
    let inputView = InputViewFactory.create(authority)
    let requestString = inputView.fetchInput()
    
    do {
        let request = try RequestFactory.create(authority: authority,
                                                input: requestString)
        let order = StateHandleableFactory.create(request)
        vendingMachine.setStrategy(order)
        try vendingMachine.execute()
    } catch {
        let handler = ErrorHandler(error: error)
        handler.handle(logic: OutputView.showError)
    }
}
