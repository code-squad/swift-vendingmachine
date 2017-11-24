//
//  Manager.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Manager: EnableMode {
    var delegate: ManagerModeDelegateProtocol
    enum Option: Int {
        case addInventory = 1
        case deleteInventory = 2
        case exit = 3
    }

    init(target: ManagerModeDelegateProtocol) {
        delegate = target
    }

    mutating func makeMenu() -> (mode: VendingMachineMode ,money: Int, menu: [Drink : Int]) {
        let income = delegate.howMuchIncome()
        let managerMenu = delegate.listOfInventory()
        return ( .manager, income, managerMenu)
    }

    mutating func action(option: Int, detail: Int) throws {
        do {
            switch option {
            case Option.addInventory.rawValue:
                try delegate.add(productIndex: detail)
            case Option.deleteInventory.rawValue:
                try delegate.delete(productIndex: detail)
            default: break
            }
        } catch let error {
            throw error
        }
    }

}
