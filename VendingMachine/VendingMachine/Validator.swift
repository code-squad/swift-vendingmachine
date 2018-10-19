//
//  Validator.swift
//  VendingMachine
//
//  Created by 이동건 on 18/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Validator {
    typealias UserChoice = (menu: MenuType, value: Int)
    
    static func validate(_ rawValue: String?, with stocks: Stocks) throws -> UserChoice {
        guard let rawValue = rawValue else { throw VendingMachineError.wrongInput }
        let parsed = rawValue.split(separator: " ").map { String($0) }
        guard let first = parsed.first, let menu = MenuType(rawValue: first) else { throw VendingMachineError.wrongInput }
        guard let second = parsed.last, let value = Int(second) else { throw VendingMachineError.wrongInput }
        if !checkRange(of: (menu, value), stocks: stocks) { throw VendingMachineError.wrongInput }
        return (menu, value)
    }
    
    private static func checkRange(of user: UserChoice, stocks: Stocks) -> Bool {
        let menu = user.menu
        let value = user.value
        switch menu {
        case .deposit:
            return value > 0
        case .purchase:
            return stocks.hasBundle(value)
        }
    }
}
