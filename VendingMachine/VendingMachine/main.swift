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
    
    static func start() throws {
        while true {
            let choice = try input()
            try handleOrder(choice)
        }
    }
    
    private static func input() throws -> Validator.UserChoice {
        OutputView.display(with: Comment.introdution(account: machine.remain))
        OutputView.display(with: Comment.list(machine.bundles, hasPrice: machine.remain != 0))
        let rawValue = InputView.read(with: machine.bundles, account: machine.remain)
        return try Validator.validate(rawValue, with: stocks)
    }
    
    private static func handleOrder(_ choice: Validator.UserChoice) throws {
        let menu = choice.menu
        let value = choice.value
        
        switch menu {
        case .deposit:
            machine.remain = value
        case .purchase:
            let origin = machine.remain
            let item = try machine.buy(at: value)
            let after = machine.remain
            OutputView.display(with: Comment.buy(beverage: item, price: origin - after))
        case .history:
            OutputView.display(with: Comment.history(history: machine.history))
        }
    }
}

do {
    try Main.start()
} catch let err as VendingMachineError {
    OutputView.display(with: err)
}

