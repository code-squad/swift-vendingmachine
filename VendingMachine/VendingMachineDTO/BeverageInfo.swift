//
//  BeverageInfo.swift
//  VendingMachine
//
//  Created by hw on 09/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class BeverageInfo {
    private var nameInfo: String!
    private var priceInfo: Int!
    
    var name: String {
        guard let name = self.nameInfo else{
            return ""
        }
        return name
    }
    var price: Int{
        guard let price = self.priceInfo else{
            return 0
        }
        return price
    }
    
    init(drink: Drink){
        drink.displayDrinkNamePriceInfo { (name, price) in
            self.nameInfo = name
            self.priceInfo = price
        }
    }
    
    func isSameDrinkGroup(_ drink: Drink ) -> Bool {
        var result = false
        drink.displayDrinkNamePriceInfo { (name, price)  in
            result = self.nameInfo == name ? true : false
            result = self.priceInfo == price ? true : false
        }
        return result
    }
    
    func isPurchasable(_ money: Int ) -> Bool {
        if money >= priceInfo {
            return true
        }
        return false
    }
}
