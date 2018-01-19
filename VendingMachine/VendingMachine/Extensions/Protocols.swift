//
//  Protocols.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

let allMenus = BeverageMenu.allValues

protocol Userable {
    func insertMoney(coin: Int)
    func deductMoney(coin: Int) throws
    func countChange() -> Int
    func buyBeverage(beverageMenu: BeverageMenu) throws
}

protocol MachineManagerable {
    func supply(_ defaultQuantity: Int)
    func insertBeverage(beverageMenu: BeverageMenu, quantity: Int)
    func deductBeverage(beverageMenu: BeverageMenu, quantity: Int) throws
    func countBeverageQuantity(beverageMenu: BeverageMenu) -> Int
    func checkCurrentInventory() -> [BeverageBox]
}
