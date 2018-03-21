//
//  Controller.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class Controller {
    private var modeActivation: ModeActivation?
    private var core: ControllerCore
    var isModeSelected: Bool {
        return self.modeActivation != nil
    }
    init() {
        self.core = ControllerCore()
    }
    func selectMode(menuNum: Int) throws {
        switch menuNum {
        case Mode.admin.rawValue:
            self.modeActivation = AdminMode(core)
        case Mode.user.rawValue:
            self.modeActivation = UserMode(core)
        default:
            throw Controller.ModeError.invalidNumber
        }
    }
    
    func makeMenu() -> (mode: Mode, money: Int, menu: [Beverage], inventory: [Beverage:Int])? {
        if let modeActivation = self.modeActivation {
            return modeActivation.makePreGameMenu()
        }
        return nil
    }
    
    func action(action: Action, detail: Int) throws {
        switch action {
        case .add, .delete:
            do {
                try self.modeActivation?.action(actionType: action, detail: detail)
            } catch ControllerCore.stockError.soldOut {
                print(ControllerCore.stockError.soldOut.rawValue)
            } catch ControllerCore.stockError.invalidProductNumber {
                print(ControllerCore.stockError.invalidProductNumber.rawValue)
            } catch ControllerCore.stockError.empty {
                print(ControllerCore.stockError.empty.rawValue)
            }
        case .exit:
            self.modeActivation = nil
        }
    }
    
    func makeResultOfOrder() -> Beverage? {
        if let mode = self.modeActivation as? UserMode {
            return mode.selectDrink()
        }
        return nil
    }
    
    
}

extension Controller {
    enum Mode: Int {
        typealias RawValue = Int
        case admin = 1
        case user = 2
    }
    enum ModeError: String, Error {
        case invalidNumber = "유효하지 않은 모드입니다."
    }
}

enum Action: Int {
    case add = 1
    case delete = 2
    case exit = 3
}


