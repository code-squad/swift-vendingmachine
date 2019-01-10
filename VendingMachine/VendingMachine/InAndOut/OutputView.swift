//
//  OutputView.swift
//  VendingMachine
//
//  Created by 윤동민 on 03/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printMachineState(of machine: PrintableMachingState) {
        machine.machineState { coin, stocks in
            for index in 1...stocks.stockCount() {
                print(stocks.convertStringDrink(index: index))
            }
        }
    }
    
    static func printOrder(of state: State) {
        print(state.rawValue)
    }
    
    static func printStart(message: String) {
        print(message)
    }
    
    static func printInsert(coin: Int) {
        print("\(coin)을 투입하셨습니다.\n")
    }
    
    static func printPickMessage(menu: Beverage) {
        print("\(type(of: menu))을 구매하셨습니다. \(menu.price)원을 차감합니다.\n")
    }
}
