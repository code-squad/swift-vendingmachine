//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation
// - MARK: - Set Up
let products = ProductFactory.create(quantity: 10)

let inventory = Inventory(products: products)

var vendingMachine = VendingMachine(
    balance: Money(value: 0),
    inventory: inventory,
    history: History())

var mode: Authority
var inputView: InputView
var inputString = ""

while vendingMachine.isOnSale {
    
    inputView = InputViewFactory.create(.none)
    inputString = inputView.fetchInput()
    mode = Authority(input: inputString)
    
    vendingMachine.handleProductStatistic(OutputView.showStatistic)
    vendingMachine.handleMoney(OutputView.showBalance)
    
    inputView = InputViewFactory.create(mode)
    inputString = inputView.fetchInput()
    
    do {
        let request = try RequestFactory.create(authority: mode, input: inputString)
        let order = StateHandleableFactory.create(request)
        vendingMachine.setStrategy(order)
        try vendingMachine.execute()
    } catch {
        let handler = ErrorHandler(error: error)
        handler.handle(logic: OutputView.showError)
    }
}
