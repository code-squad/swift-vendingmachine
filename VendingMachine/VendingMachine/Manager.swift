//
//  Manager.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct Manager: EnableMode {
    var delegate: ManagerMode
    enum Option: Int {
        case addInventory = 1
        case deleteInventory = 2
    }
    
    init(managerMode: ManagerMode) {
        delegate = managerMode
    }
    
    mutating func action(option: Int, detail: Int) throws -> Drink? {
        switch option {
        case Option.addInventory.rawValue:
            try delegate.add(productIndex: detail)
            return nil
        case Option.deleteInventory.rawValue:
            let drink = try delegate.delete(productIndex: detail)
            return drink
        default:
            throw OptionError.invalidAction
        }
    }
    
}

extension Manager {
    enum OptionError: String, Error {
        case invalidAction = "유효하지 않은 명령입니다."
    }
}
