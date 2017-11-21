//
//  ManagerMode.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

protocol ManagerMode {
    mutating func add(money: Int)
    @discardableResult mutating func add(product: Drink) -> Int
    func listOfInventory() -> [Drink : Count]
    func listOfOverExpirationDate() -> [Drink]
}
