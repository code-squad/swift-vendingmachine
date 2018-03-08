//
//  InputView.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 30..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {

    func askSelectMode(message: ProgramDescription) -> ProgramMode {
        print(message.description)
        var mode = ProgramMode.none
        let input = readLine() ?? ""

        if input == "q" {
            mode = .quit
        } else {
            let inputNumber = Int(input) ?? 0
            switch inputNumber {
            case 1:
                mode = .admin
            case 2:
                mode = .user
            default:
                mode = .none
            }
        }
        return mode
    }

    func askUserExecuteOption(message: CustomStringConvertible) -> (action: UserMenu, option: Int) {
        print(message)
        var result = (action: UserMenu.none, option: 0)

        let input = readLine() ?? ""

        if input == "q" {
            result = (action: .quit, option: 0)
        } else if input.contains(" ") {
            let splitInput = (input.split(separator: " ")).map({ Int($0) ?? 0 })
            switch splitInput[0] {
            case 1: result = (action: .addBalance, option: splitInput[1])
            case 2: result = (action: .buyItem, option: splitInput[1])
            default: result = (action: .none, option: 0)
            }
        } else {
            return result
        }
        return result
    }

    func askAdminExecuteOption(message: CustomStringConvertible) -> (action: AdminMenu, option: Int) {
        print(message)
        var result = (action: AdminMenu.none, option: 0)
        let input = readLine() ?? ""

        if input.contains(" ") {
            let splitInput = (input.split(separator: " ")).map({ Int($0) ?? 0 })
            switch splitInput[0] {
            case 1: result = (action: .addItem, option: splitInput[1])
            case 2: result = (action: .deleteItem, option: splitInput[1])
            default: return result
            }
        } else if input == "q" {
            result = (action: .quit, option: 0)
        } else {
            return result
        }
        return result
    }

    func askAdminModeAction(message: CustomStringConvertible) -> AdminMenu {
        print(message)

        let input = readLine() ?? ""
        guard input != "q" else {
            return .quit
        }
        guard let actionNumber = Int(input) else {
            return .none
        }
        switch actionNumber {
        case 1: return .addItem
        case 2: return .deleteItem
        default: return .none
        }
    }

    func askOptionNumber(message: CustomStringConvertible) -> Int {
        print(message)
        let input = readLine() ?? ""
        guard let number = Int(input) else {
            return 0
        }
        return number
    }

}
