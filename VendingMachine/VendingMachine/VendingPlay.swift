//
//  UserPlay.swift
//  VendingMachine
//
//  Created by 윤동민 on 03/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct VendingPlay {
    static func play(with machine: VendingMachine) {
        var input: [String]
        OutputView.printState(of: machine)
        input = splitOrder(of: InputView.selectMenu())
    }
    
    private static func excute(of order: [String], machine: VendingMachine) {
        guard let menu = OrderMenu.init(rawValue: order[0]) else { return }
        guard let value = Int(order[1]) else { return }
        
        switch menu {
        case .addCoin:
            machine.insert(coin: value)
        case .buyDrink:
            machine.sell(menu: value)
        }
    }
    
    private static func splitOrder(of input: String) -> [String] {
        return input.split(separator: " ").map{ String.init($0) }
    }
}
