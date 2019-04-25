//
//  Menu.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// MARK: - Struct Menu
struct Menu {
    // 종료하는걸 만듬
    static func moveHighStep(input: String) -> Bool {
        return input.contains("q")
    }
    // 뭘 입력받았는지에 따라 에러를 다르게 표현
    static func readUserMode(input: String) throws -> UserMode {
        guard let number = Int(input) else { throw MenuError.notInt }
        guard let mode = UserMode(rawValue: number) else { throw MenuError.notMenu }
        return mode
        
    }
    
    static func readMenu(input: String) throws -> (details: MenuScript, value: Int) {
        let menuSelected = input.split(separator: " ")
        
        guard let firstScript = Int(menuSelected[0]) else {
            throw MenuError.notInt
        }
        
        guard let menu = MenuScript(rawValue: firstScript) else {
            throw MenuError.notMenu
        }

        if Int(menuSelected[0]) == 0 {
            return (menu,0)
        }
        
        guard menuSelected.count == 2 else {
            throw MenuError.invalidForm
        }
        
        guard let value = Int(menuSelected[1]) else {
            throw MenuError.notInt
        }
        
        guard value > 0 else {
            throw MenuError.notNegativeNumber
        }
        
        return (menu, value)
    }
    
}
