//
//  UserModeDelegateProtocol.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

protocol UserModeDelegateProtocol {
    mutating func add(money: Int)
    func listOfCanBuy() -> [Drink : Count]
    @discardableResult func buy(product: Drink) -> Drink?
    @discardableResult func buy(productIndex: Int) throws -> Drink
    func howMuchRemainMoney() -> Price
    func listOfHotDrink() -> [Drink] 
    func listOfPurchase() -> Array<(key: Drink, value: Count)>
    func extractAllMoney() -> Int
}
