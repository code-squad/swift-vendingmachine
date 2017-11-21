//
//  UserMode.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

protocol UserMode {
    func listOfCanBuy() -> Array<(key: Drink, value: Count)>
    @discardableResult mutating func buy(product: Drink) -> Drink?
    @discardableResult mutating func buy(productIndex: Int) throws -> Drink
    func howMuchRemainMoney() -> Price
    func listOfHotDrink() -> [Drink] 
    func listOfPurchase() -> Array<(key: Drink, value: Count)>
    mutating func extractAllMoney() -> Int
}
