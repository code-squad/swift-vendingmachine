//
//  Protocols.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

typealias Stock = Int
typealias Balance = Int
typealias Purchased = Int

protocol Machine {
    associatedtype Menu: EnumCollection
}

protocol Managable: Machine {
    func fullSupply(_ count: Int)
    func supply(beverageType: Menu, _ addCount: Stock)
    func checkTheStock() -> [Menu:Stock]
    func showPurchasedList() -> [HistoryInfo]
}

protocol UserServable: Machine {
    func popBeverage(_ menu: Menu) -> Beverage?
    func insertMoney(_ money: MoneyManager.Unit)
    func showBalance() -> Balance
    func showAffordableBeverages() -> [Menu]
    func showExpiredBeverages(on day: Date) -> [Menu:Stock]
    func showHotBeverages() -> [Menu]
}

protocol ActivateMode {
    func perform()
    func showResult()
}
