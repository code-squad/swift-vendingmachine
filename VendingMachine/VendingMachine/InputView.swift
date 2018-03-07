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
        var mode = ProgramMode.None
        let input = readLine() ?? ""

        if input == "q" {
            mode = .Quit
        } else {
            let inputNumber = Int(input) ?? 0
            switch inputNumber {
            case 1:
                mode = .Admin
            case 2:
                mode = .User
            default:
                mode = .None
            }
        }
        return mode
    }

    func askUserExecuteOption(message: CustomStringConvertible) -> (action: UserMenu, option: Int) {
        print(message)
        var result = (action: UserMenu.None, option: 0)

        let input = readLine() ?? ""

        if input == "q" {
            result = (action: .Quit, option: 0)
        } else if input.contains(" ") {
            let splitInput = (input.split(separator: " ")).map({ Int($0) ?? 0 })
            switch splitInput[0] {
            case 1: result = (action: .AddBalance, option: splitInput[1])
            case 2: result = (action: .BuyItem, option: splitInput[1])
            default: result = (action: .None, option: 0)
            }
        } else {
            return result
        }
        return result
    }

    func askAdminExecuteOption(message: CustomStringConvertible) -> (action: AdminMenu, option: Int) {
        print(message)
        var result = (action: AdminMenu.None, option: 0)
        let input = readLine() ?? ""

        if input.contains(" ") {
            let splitInput = (input.split(separator: " ")).map({ Int($0) ?? 0 })
            switch splitInput[0] {
            case 1: result = (action: .AddItem, option: splitInput[1])
            case 2: result = (action: .DeleteItem, option: splitInput[1])
            default: return result
            }
        } else if input == "q" {
            result = (action: .Quit, option: 0)
        } else {
            return result
        }
        return result
    }


    func askAdminModeAction(message: CustomStringConvertible) -> AdminMenu {
        print(message)

        let input = readLine() ?? ""
        guard input != "q" else {
            return .Quit
        }
        guard let actionNumber = Int(input) else {
            return .None
        }
        switch actionNumber {
        case 1: return .AddItem
        case 2: return .DeleteItem
        default: return .None
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

