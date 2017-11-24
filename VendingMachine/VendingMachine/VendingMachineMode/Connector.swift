//
//  Connector.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 23..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Connector {
    var enableMode: EnableMode?
    var hasMode: Bool {
        return enableMode != nil
    }

    // 입력한 모드에 대한 처리. 모드에 따라 메니저와 자판기, 유저와 자판기 연결
    mutating func assignMode(target: VendingMachine, mode: Int) throws {
        switch mode {
        case VendingMachineMode.manager.rawValue:
            self.enableMode = Manager(target: target)
        case VendingMachineMode.user.rawValue:
            self.enableMode = User(target: target)
        default:
            throw VendingMachine.ModeError.invalidNumber
        }
    }

    func makeMenu() -> (mode: VendingMachineMode ,money: Int, menu: [Drink : Int])? {
        if var enableMode = self.enableMode {
            return enableMode.makeMenu()
        }
        return nil
    }

    mutating func action(option: Int, detail: Int) throws {
        switch option {
        case VendingMachineMode.manager.rawValue, VendingMachineMode.user.rawValue:
            do {
                try self.enableMode?.action(option: option, detail: detail)
            } catch let error {
                throw error
            }
        case Manager.Option.exit.rawValue, User.Option.exit.rawValue:
            enableMode = nil
        default:
            throw VendingMachine.OptionError.invalidNumber
        }
    }

}
