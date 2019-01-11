//
//  OutputView.swift
//  VendingMachine
//
//  Created by 윤동민 on 03/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static func printUserModeState(of machine: PrintableMachingState) {
        machine.machineStateInUserMode { coin, stocks in
            print("\n현재 투입한 금액은 \(coin.convertToString())원 입니다. 다음과 같은 음료가 있습니다.")
            for index in 1...stocks.stockCount() {
                print(stocks.convertStringDrink(index: index))
            }
        }
    }
    
    static func printManagerModeState(of machine: PrintableMachingState) {
        machine.machineStateInManagerMode { stocks in
            print("\n현재 재고는 다음과 같이 있습니다.")
            for index in 1...stocks.stockCount() {
                print(stocks.convertStringDrink(index: index))
            }
        }
    }
    
    static func printOrder(of state: OrderState) {
        print(state.convertString())
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
