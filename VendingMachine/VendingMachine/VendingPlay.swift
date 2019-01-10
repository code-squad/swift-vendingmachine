//
//  UserPlay.swift
//  VendingMachine
//
//  Created by 윤동민 on 03/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct VendingPlay {
    static func start() -> Mode {
        while true {
            OutputView.printStart(message: "자판기를 시작합니다.")
            let input = InputView.select(message: "1. 관리자 모드\n2. 사용자 모드\n> ")
            if let mode = Mode(rawValue: input) { return mode }
        }
    }
    
    static func play(by mode: Mode, with machine: VendingMachine) {
        OutputView.printMachineState(of: machine)
        let input = InputView.select(message: "1. 금액추가\n2. 음료구매\n> ")
        excute(by: splitOrder(of: input), machine)
    }
    
    private static func excute(by order: [String], _ machine: VendingMachine) {
        guard let menu = OrderMenu.init(rawValue: order[0]) else { return }
        guard let value = Int(order[1]) else { return }
        var state: State
        
        switch menu {
        case .insertCoin: state = machine.insert(coin: value)
        case .pickDrink: state = machine.pick(menu: value)
        }
        if state != .success { OutputView.printOrder(of: state) }
    }
    
    private static func splitOrder(of input: String) -> [String] {
        return input.split(separator: " ").map{ String.init($0) }
    }
}
