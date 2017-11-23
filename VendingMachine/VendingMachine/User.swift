//
//  User.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

struct User: EnableMode {
    var delegate: UserMode
    enum Option: Int {
        case addMoney = 1
        case buyDrink = 2
        case exit = 3
    }
    init(userMode: UserMode) {
        delegate = userMode
    }
    
    mutating func makeMenu() -> (mode: VendingMachineMode, money: Int, menu: [Drink : Int]) {
        let income = delegate.howMuchRemainMoney()
        let userMenu = delegate.listOfCanBuy()
        return (.user, income, userMenu)
    }
    
    mutating func action(option: Int, detail: Int) throws -> Drink? {
        switch option {
        case Option.addMoney.rawValue:
            delegate.add(money: detail)
            return nil
        case Option.buyDrink.rawValue:
            let drink = try delegate.buy(productIndex: detail)
            return drink
        case Option.exit.rawValue:
            throw OptionError.exitUser
        default:
            throw OptionError.invalidAction
        }
    }
}

extension User {
    enum OptionError: String, Error {
        case invalidAction = "유효하지 않은 명령입니다."
        case exitUser = "유저 모드 나가기"
    }
}
