//
//  UserMode.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol UserModeCore {
    func insertMoney(userMoney: Int)
    func buyableBeverages() -> [Beverage]
    func buy(productIndex: Int) throws -> Beverage
    func userBalance() -> Int
    func shoppingHistory() -> [Beverage]
    func withdrawlBalance() -> Int
    func listOfInventory() -> [Beverage:Int]
}

class UserMode: ModeActivation {
    private var core: UserModeCore
    private var beverage: Beverage?
    init(_ core: UserModeCore) {
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
    
    
    
    
    
    
