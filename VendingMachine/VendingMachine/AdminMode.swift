//
//  AdminMode.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol AdminModable: AdminIncome {
    func add(productIndex: Int) throws
    func subtract(productIndex: Int) throws -> Beverage
    func listOfInventory() -> [Beverage:Int]
    func checkListOfOverExpirationDate() -> [Beverage]
    func drinkLists() -> [Beverage]
}

protocol AdminIncome {
    func checkIncome() -> Int
  
}


class AdminMode: ModeActivation {
    var core: AdminModable
    init(_ core: AdminModable) {
        self.core = core
    }
    
    func makePreGameMenu() -> (mode: Controller.Mode, money: Int, menu: [Beverage], inventory: [Beverage:Int]) {
        let income = core.checkIncome()
        let drinkLists = core.drinkLists()
        let inventory = core.listOfInventory()
        return ( .admin, income, drinkLists, inventory)
    }
    
    func action(actionType: Action, detail: Int) throws {
        do {
            switch actionType {
            case .add: try core.add(productIndex: detail)
            case .delete: let _ = try core.subtract(productIndex: detail)
            case .exit: break
            }
        } catch let error {
            throw error
        }
    }
}
