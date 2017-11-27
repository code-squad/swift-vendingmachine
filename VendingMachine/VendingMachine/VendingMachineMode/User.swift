//
//  User.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct User: EnableMode {
    private var delegate: UserModeDelegate
    private var drink: Drink?

    enum Option: Int {
        case addMoney = 1
        case buyDrink = 2
    }
    init(target: UserModeDelegate) {
        delegate = target
    }

    mutating func makeMenu() -> MenuContents {
        let income = delegate.howMuchRemainMoney()
        let userMenu = delegate.listOfCanBuy()
        let userInventory = delegate.listOfInventory()
        return (.user, income, userMenu, userInventory)
    }

    mutating func action(action: Action) throws {
        switch action.option {
        case .add:
            delegate.add(money: action.detail)
        case .delete:
            do {
                self.drink = try delegate.buy(productIndex: action.detail)
            } catch let error {
                throw error
            }
        case .exit: break
        }
    }
    
    func selectDrink() -> Drink? {
        return self.drink
    }

}
