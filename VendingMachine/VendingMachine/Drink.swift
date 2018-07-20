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
}
class ChocoMilk : Milk {
}


class Soda : Drink {
}
class Coke : Soda {
}

class Coffee : Drink{
}
class TopCoffee : Coffee{
}


