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
    associatedtype MenuType: EnumCollection
}

protocol Managable: Machine {
    func fullSupply(_ count: Int)
    func supply(beverageType: MenuType, _ addCount: Stock)
    func checkTheStock() -> [MenuType:Stock]
    func showPurchasedList() -> [HistoryInfo]
}

protocol UserServable: Machine {
    func popBeverage(_ menu: MenuType) -> Beverage?
    func insertMoney(_ money: MoneyManager.Unit)
    func showBalance() -> Balance
    func showAffordableBeverages() -> [MenuType]
    func showExpiredBeverages(on day: Date) -> [MenuType:Stock]
    func showHotBeverages() -> [MenuType]
}

protocol ActivateMode: Machine {
    func perform()
    func showResult()
}
