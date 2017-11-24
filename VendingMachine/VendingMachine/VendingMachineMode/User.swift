//
//  User.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct User: EnableMode {
    var delegate: UserModeDelegateProtocol?
    enum Option: Int {
        case addMoney = 1
        case buyDrink = 2
        case exit = 3
    }
    init(target: UserModeDelegateProtocol) {
        delegate = target
    }

    mutating func makeMenu() -> (mode: VendingMachineMode, money: Int, menu: [Drink : Int]) {
        let income = delegate?.howMuchRemainMoney()
        let userMenu = delegate?.listOfCanBuy()
        return (.user, income!, userMenu!)
    }

    mutating func action(option: Int, detail: Int) throws {
        switch option {
        case Option.addMoney.rawValue:
            delegate?.add(money: detail)
        case Option.buyDrink.rawValue:
            do {
                try delegate?.buy(productIndex: detail)
            } catch let error {
                throw error
            }
        default: break
        }
    }

}
