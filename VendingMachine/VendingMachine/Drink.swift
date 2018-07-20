//
//  Drink.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 7. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

/// 날자 입출력 처리를 위한 변수
var formatter : DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd"
    return formatter
}

/// 모든 음료수의 수퍼클래스
class Drink : CustomStringConvertible {
    private let brand : String
    private let size : Int
    private let price : Int
    private let name : String
    private let manufacturingDate : Date
    
    init?(barnd:String, size:Int,price:Int, name:String, manufacturingDate:String) {
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

/// 우유 클래스
class Milk : Drink {
}
class ChocoMilk : Milk {
}

/// 탄산음료 클래스
class Soda : Drink {
}
class Coke : Soda {
}

/// 커피 클래스
class Coffee : Drink{
}
class TopCoffee : Coffee{
}


