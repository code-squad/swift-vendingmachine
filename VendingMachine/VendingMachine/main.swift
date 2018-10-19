//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation


class Main {
    private static let beverages: [Beverage] = [
        Latte(milk: 0.2, art: .none, caffeine: 0.3, brand: "맥심", volume: 250, price: 3000, name: "TOP라때", date: Date(timeIntervalSinceNow: -Date.convert(weeks: 1))),
        FruitMilk(fruit: .strawberry, fat: 0.3, code: "강원03-21", brand: "서울우유", volume: 250, price: 2000, name: "딸기듬뿍", date: Date(timeIntervalSinceNow: -Date.convert(weeks: 2))),
        FruitMilk(fruit: .strawberry, fat: 0.3, code: "강원03-21", brand: "서울우유", volume: 250, price: 2000, name: "딸기듬뿍", date: Date(timeIntervalSinceNow: -Date.convert(weeks: 1))),
        RiceWine(area: .busan, alcohol: 0.3, brand: "금정산성토산주", volume: 400, price: 7000, name: "금정산성막걸리", date: Date(timeIntervalSinceNow: -Date.convert(days: 5))),
        RiceWine(area: .busan, alcohol: 0.3, brand: "금정산성토산주", volume: 400, price: 7000, name: "금정산성막걸리", date: Date(timeIntervalSinceNow: -Date.convert(days: 3))),
        RiceWine(area: .busan, alcohol: 0.3, brand: "금정산성토산주", volume: 400, price: 7000, name: "금정산성막걸리", date: Date(timeIntervalSinceNow: -Date.convert(days: 6)))
    ]
    private static var stocks = Stocks(beverages)
    private static let machine = VendingMachine(stocks)
    private static var history = History()
    
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
                    history.append(beverage)
                case .history:
                    OutputView.display(with: Comment.history(history: history))
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

