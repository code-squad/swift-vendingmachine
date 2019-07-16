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
    private (set) var quantityInfo: Int!
    private (set) var brandInfo: String!
    
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
    
    var dummyDrink : Drink {
        return Drink.init(brand: brandInfo, quantity: quantityInfo, price: self.priceInfo, name: self.nameInfo)
    }
    
    init(drink: Drink){
        drink.displayDrinkInfo { (brand, name, price, quantity) in
            self.nameInfo = name
            self.priceInfo = price
            self.quantityInfo = quantity
            self.brandInfo = brand
        }
    }
    
    func isSameDrinkGroup(_ drink: Drink ) -> Bool {
        var result = false
        drink.displayDrinkInfo { (brand, name, price, quantity)  in
            result = self.nameInfo == name ? true : false
            result = self.priceInfo == price ? true : false
            result = self.brandInfo == brand ? true : false
            result = self.quantityInfo == quantity ? true: false
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
