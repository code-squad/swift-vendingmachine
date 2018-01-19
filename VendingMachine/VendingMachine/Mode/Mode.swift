//
//  Mode.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Mode {
    func act(input: (InputView.Mode, Int), machine: Userable & MachineManagerable) throws -> Userable & MachineManagerable {
        switch input.0 {
        case .insertMoney:
            machine.insertMoney(coin: input.1)
        case .buyBeverage:
            let beverageMenu = allMenus[input.1-1]
            try machine.buyBeverage(beverageMenu: beverageMenu)
        }
        
        return machine
    }
}
