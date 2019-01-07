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
        OutputView.printMachineState(of: machine)
        let input = splitOrder(of: InputView.selectMenu())
        excute(by: input, machine)
    }
    
    private static func excute(by order: [String], _ machine: VendingMachine) {
        guard let menu = OrderMenu.init(rawValue: order[0]) else { return }
        guard let value = Int(order[1]) else { return }
        var state: State
        
        switch menu {
        case .addCoin: state = machine.insert(coin: value)
        case .buyDrink: state = machine.sell(menu: value)
        }
        if state != .success { OutputView.printOrder(of: state) }
    }
    
    private static func splitOrder(of input: String) -> [String] {
        return input.split(separator: " ").map{ String.init($0) }
    }
}
