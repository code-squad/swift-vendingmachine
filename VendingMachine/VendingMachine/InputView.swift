//
//  InputView.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func readInputToMenu () -> Menu {
        let input: String
        let menu: Menu
        
        input = readLine() ?? "0"
        menu = Menu(rawValue: Int(input) ?? 0) ?? Menu.exit
        
        return menu
    }

    static func readInputToInt () -> Int {
        let input = readLine() ?? "0"
        
        return Int(input) ?? 0
    }
    
    static func readInputToManagementMenu () -> ManagementMenu {
        let input: String
        let menu: ManagementMenu
        
        input = readLine() ?? "0"
        menu = ManagementMenu(rawValue: Int(input) ?? 0) ?? ManagementMenu.exit
        
        return menu
    }
}
