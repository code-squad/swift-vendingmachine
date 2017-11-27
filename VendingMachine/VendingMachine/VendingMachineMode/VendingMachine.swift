//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 23..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

typealias VendingMachineMode = VendingMachine.Mode

struct VendingMachine {
    private var enableMode: EnableMode?
    private var core: CoreVendingMachine
    var hasMode: Bool {
        return enableMode != nil
    }

    init() {
        core = CoreVendingMachine()
    }

    // 입력한 모드에 대한 처리. 모드에 따라 메니저와 자판기, 유저와 자판기 연결
    mutating func assignMode(mode: Int) throws {
        switch mode {
        case VendingMachineMode.manager.rawValue:
            self.enableMode = Manager(target: core)
        case VendingMachineMode.user.rawValue:
            self.enableMode = User(target: core)
        default:
            throw VendingMachine.ModeError.invalidNumber
        }
    }

    func makeMenu() -> MenuContents? {
        if var enableMode = self.enableMode {
            return enableMode.makeMenu()
        }
        return nil
    }

    mutating func action(action: Action) throws {
        switch action.option {
        case .add, .delete:
            do {
                try self.enableMode?.action(action: action)
            } catch CoreVendingMachine.stockError.soldOut {
                print(CoreVendingMachine.stockError.soldOut.rawValue)
            } catch CoreVendingMachine.stockError.invalidProductNumber {
                print(CoreVendingMachine.stockError.invalidProductNumber.rawValue)
            } catch CoreVendingMachine.stockError.empty {
                print(CoreVendingMachine.stockError.empty.rawValue)
            }
        case .exit:
            self.enableMode = nil
        }
    }
    
    func makeResultOfOrder() -> Drink? {
        if let mode = self.enableMode as? User {
            return mode.selectDrink()
        }
        return nil
    }

}

extension VendingMachine {
    enum Mode: Int {
        case manager = 1
        case user = 2
    }
    enum ModeError: String, Error {
        case invalidNumber = "유효하지 않은 모드입니다."
    }
}
