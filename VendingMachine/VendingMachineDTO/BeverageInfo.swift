//
//  BeverageInfo.swift
//  VendingMachine
//
//  Created by hw on 09/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class BeverageInfo {
    
    private (set) var name: String
    private (set) var price: Int
    private (set) var metaType: String
    
    init(drink: Drink){
        self.name = drink.drinkName
        self.price = drink.price
        self.metaType = "\(type(of: drink))"
    }
    
    func isSameDrinkGroup(_ drink: Drink ) -> Bool {
        var result = false
        result = self.name == drink.drinkName ? true : false
        result = self.price == drink.price ? true : false
        result = self.metaType == "\(type(of: drink))" ? true : false
        return result
    }
    
    func isPurchasable(_ money: Int ) -> Bool {
        if money >= price {
            return true
        }
        return false
    }
}
