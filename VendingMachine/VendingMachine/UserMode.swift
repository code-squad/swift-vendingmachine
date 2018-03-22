//
//  UserMode.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol UserModable {
    func shoppingHistory() -> [Beverage]
    func buyableBeverages() -> [Beverage]
    func buy(productIndex: Int) throws -> Beverage
    func listOfInventory() -> [Beverage:Int]
    func insertMoney(userMoney: Int)
    func userBalance() -> Int
    func withdrawlBalance() -> Int
    
}

class UserMode: ModeActivation {
    private var core: UserModable
    private var beverage: Beverage?
    init(_ core: UserModable) {
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
    
    
    
    
    
    
