//
//  ManagerModeDelegate.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

protocol ManagerModeDelegate {
    @discardableResult func add(product: Drink) -> Int
    @discardableResult func add(productIndex: Int) throws -> Int
    @discardableResult func delete(product: Drink) -> Drink?
    @discardableResult func delete(productIndex: Int) throws -> Drink?
    func howMuchIncome() -> Price
    func listOfInventory() -> [Drink : Count]
    func listOfOverExpirationDate() -> [Drink]
}
