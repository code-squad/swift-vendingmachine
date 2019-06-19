//
//  MenuChecker.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct MenuChecker {
    static func checkMenu (_ input: String) throws -> Menu {
        let menu = Menu(rawValue: Int(input) ?? 0) ?? Menu.exit
        
        return menu
    }
}
