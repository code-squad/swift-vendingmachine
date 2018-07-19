//
//  Drink.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 7. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Drink {
    let brand : String
    let size : Int
    let price : Int
    let name : String
    let manufacturingDate : Date
    
    init(barnd:String, size:Int,price:Int, name:String, manufacturingDate:Date) {
        self.brand = barnd
        self.size = size
        self.price = price
        self.name = name
        self.manufacturingDate = manufacturingDate
    }
    
    
}

class Milk : Drink {
    enum Flavor {
        case strawberry
        case choco
        case banana
    }
    
    let flavor : Flavor
    
    init(flavor:Flavor,barnd:String, size:Int,price:Int, name:String, manufacturingDate:Date){
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
    
    let flavor : Flavor
    
    init(flavor:Flavor,barnd:String, size:Int,price:Int, name:String, manufacturingDate:Date){
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
    
    let flavor : Flavor
    
    init(flavor:Flavor,barnd:String, size:Int,price:Int, name:String, manufacturingDate:Date){
        self.flavor = flavor
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate)
    }
}



