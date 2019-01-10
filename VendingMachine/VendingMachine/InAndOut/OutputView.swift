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
}
