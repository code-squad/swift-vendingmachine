//
//  Protocols.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol Userable {
    func insertMoney(coin: Money) throws
    func deductMoney(coin: Money) throws
    func countChange() -> Int
    func buyBeverage(beverageMenu: BeverageMenu) throws
}
