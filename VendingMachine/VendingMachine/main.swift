//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation


class Main {
    private static let beverages: [Beverage] = Beverage.sample
    private static var stocks = Stocks(beverages)
    private static let machine = VendingMachine(stocks)
    
    static func start() {
        while true {
            let remain = machine.transactions
            let menu = machine.availables
            let rawValue = InputView.read(with: menu, account: remain)
            do {
                let validated = try Validator.validate(rawValue, with: stocks)
                let menu = validated.menu
                let value = validated.value
                switch menu {
                case .deposit:
                    machine.transactions = value
                case .purchase:
                    let beverage = try machine.buy(at: value)
                    let price = remain - machine.transactions
                    OutputView.display(with: Comment.buy(beverage: beverage, price: price))
                case .history:
                    OutputView.display(with: Comment.history(history: machine.history))
                }
            } catch let err as VendingMachineError {
                OutputView.display(with: err)
            } catch {
                OutputView.display(with: .unknown)
            }
        }
    }
}

Main.start()

