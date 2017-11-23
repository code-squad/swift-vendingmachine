//
//  Connector.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 23..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Connector {

    static func assignMode(target: VendingMachine, mode: Int) throws -> EnableMode {
        switch mode {
        case VendingMachineMode.manager.rawValue:
            return Manager(managerMode: target)
        case VendingMachineMode.user.rawValue:
            return User(userMode: target)
        default:
            throw VendingMachine.ModeError.invalidNumber
        }
    }

}
