//
//  ManagerMode.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

protocol ManagerMode {
    @discardableResult mutating func add(product: Drink) -> Int
    @discardableResult mutating func add(productIndex: Int) throws -> Int
    @discardableResult mutating func delete(product: Drink) -> Drink?
    @discardableResult mutating func delete(productIndex: Int) throws -> Drink?
    func listOfInventory() -> [Drink : Count]
    func listOfOverExpirationDate() -> [Drink]
}
