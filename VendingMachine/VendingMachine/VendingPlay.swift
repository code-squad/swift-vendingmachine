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
    
    static func run(by mode: Mode, with machine: VendingMachine) {
        switch mode {
        case .user: runUserMode(with: machine)
        case .manager: runManagerMode(with: machine)
        }
    }
    
    private static func runUserMode(with machine: VendingMachine) {
        while true {
            OutputView.printUserModeState(of: machine)
            let input = InputView.select(message: "1. 금액추가\n2. 음료구매\n> ")
            excuteUserOrder(by: splitOrder(of: input), machine)
        }
    }
    
    private static func excuteUserOrder(by order: [String], _ machine: UserAvailableMode) {
        guard order.count == 2 else { return }
        guard let menu = UserMenu.init(rawValue: order[0]) else { return }
        guard let value = Int(order[1]) else { return }
        var state: State
        
        switch menu {
        case .insertCoin: state = machine.isAbleToInsert(coin: value)
        case .pickDrink: state = machine.isAbleToPick(menu: value)
        }
        guard state == .success else {
            OutputView.printOrder(of: state)
            return
        }
        switch menu {
        case .insertCoin:
            machine.insert(coin: value)
            OutputView.printInsert(coin: value)
        case .pickDrink:
            let drink = machine.pick(menu: value)
            OutputView.printPickMessage(menu: drink)
        }
    }
    
    private static func runManagerMode(with machine: VendingMachine) {
        while true {
            OutputView.printManagerModeState(of: machine)
            let input = InputView.select(message: "1. 재고추가\n2. 재고삭제\n> ")
            excuteManagerOrder(by: splitOrder(of: input), machine)
        }
    }
    
    private static func excuteManagerOrder(by order: [String], _ machine: ManageableMode) {
        guard order.count == 2 else { return }
        guard let menu = ManagerMenu.init(rawValue: order[0]) else { return }
        guard let value = Int(order[1]) else { return }
        var state: State
        
        switch menu {
        case .add: state = machine.isAbleToAdd(menu: value)
        case .remove: state = machine.isAbleToRemove(menu: value)
        }
        guard state == .success else {
            OutputView.printOrder(of: state)
            return
        }
        switch menu {
        case .add: machine.addStock(menu: value)
        case .remove: machine.removeDrink(value)
        }
    }
    
    private static func splitOrder(of input: String) -> [String] {
        return input.split(separator: " ").map{ String.init($0) }
    }
}
