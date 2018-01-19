//
//  Protocols.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol Userable {
    func insertMoney(coin: Money.Unit)
    func deductMoney(coin: Int) throws
    func countChange() -> Int
    func buyBeverage(beverageMenu: BeverageMenu) throws
}

protocol VendingMachineManagerable {
    func insertBeverage(beverageMenu: BeverageMenu, quantity: Int)
    func deductBeverage(beverageMenu: BeverageMenu, quantity: Int) throws
    func countBeverageQuantity(beverageMenu: BeverageMenu) -> Int
}
