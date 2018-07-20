//
//  Drink.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 7. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Drink : CustomStringConvertible {
    private let brand : String
    private let size : Int
    private let price : Int
    private let name : String
    private let manufacturingDate : Date
    private let formatter = DateFormatter()
    
    init?(barnd:String, size:Int,price:Int, name:String, manufacturingDate:String) {
        self.formatter.dateFormat = "yyyyMMdd"
        self.brand = barnd
        self.size = size
        self.price = price
        self.name = name
        guard let date = formatter.date(from: manufacturingDate) else {
            return nil
        }
        self.manufacturingDate = date
    }
    
    var description : String  {
        return ("\(brand), \(size)ml, \(price)원, \(brand), \(formatter.string(from: manufacturingDate))")
    }
}

class Milk : Drink {
    enum Flavor {
        case strawberry
        case choco
        case banana
    }
    
    private let flavor : Flavor
    
    init?(flavor:Flavor,barnd:String, size:Int,price:Int, name:String, manufacturingDate:String){
        self.flavor = flavor
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    
}

class Soda : Drink {
    enum Flavor{
        case coke
        case cider
        case fanta
    }
    
    private let flavor : Flavor
    
    init?(flavor:Flavor,barnd:String, size:Int,price:Int, name:String, manufacturingDate:String){
        self.flavor = flavor
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate)
    }
}

class Coffee : Drink{
    enum Flavor {
        case top
        case cantata
        case georgia
    }
    
    private let flavor : Flavor
    
    init?(flavor:Flavor,barnd:String, size:Int,price:Int, name:String, manufacturingDate:String){
        self.flavor = flavor
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate)
    }
}



