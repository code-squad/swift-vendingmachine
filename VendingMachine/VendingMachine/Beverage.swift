//
//  File.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    var description: String {
        return "\(type(of:self)) - \(self.brand), \(self.size)ml, \(self.price)원, \(self.name), \(self.openDate.toString())"
    }
    
    private let brand: String
    private let size: Int
    private let price: Int
    private let name: String
    private let openDate: Date
    private let expiryDate: Int
    
    init(brand:String, size:Int, price:Int, name:String, openDate:Date, expiryDate: Int) {
        self.brand = brand
        self.size = size
        self.price = price
        self.name = name
        self.openDate = openDate
        self.expiryDate = expiryDate
    }
    
    func buyableProduct(money: Int) -> String? {
        if self.price <= money {
            return "\(self.name) \(self.price)원"
        } else {
            return nil
        }
    }
    
    func readName() -> String {
        return self.name
    }
    
    func isExpiryDateOut() -> Bool {
        return self.openDate + self.expiryDate.convertToDay() < Date()
    }
    
    func pay(pay: (Int) -> Int) -> Int {
        return pay(self.price)
    }
    
    func postPurchaseMent(makeMent: (String, Int) -> String) -> String {
        return makeMent(self.name, self.price)
    }
}
