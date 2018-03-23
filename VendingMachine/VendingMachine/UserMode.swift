//
//  UserMode.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol UserModable {
    func listOfInventory() -> [Beverage:Int]
}

protocol UserMoney {
    mutating func insertMoney(userMoney: Int)
    mutating func userBalance() -> Int
    mutating func withdrawlBalance() -> Int
}

class UserMode: ModeActivation {
    private var core: ControllerCore
    private var beverage: Beverage?
    init(_ core: ControllerCore) {
        self.core = core
    }
    func action(actionType: Action, detail: Int) throws {
        switch actionType {
        case .add: core.insertMoney(userMoney: detail)
        case .delete:
            do {
                self.beverage = try core.buy(productIndex: detail)
            } catch let error {
                throw error
            }
        case .exit: let _ = core.withdrawlBalance(); break
        }
    }
    
    func makePreGameMenu() -> (mode: Controller.Mode, money: Int, menu: [Beverage], inventory: [Beverage:Int]) {
        let userBalance = core.userBalance()
        let buyableBeverage = core.buyableBeverages()
        let inventory = core.listOfInventory()
        
        return (.user, userBalance, buyableBeverage, inventory)
    }
    
    func selectDrink() -> Beverage? {
        return self.beverage
    }
}
