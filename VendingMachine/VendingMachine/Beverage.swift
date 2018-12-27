//
//  Beverage.swift
//  VendingMachine
//
//  Created by 윤동민 on 21/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Beverage {
    var name: String
    var brand: String
    var volume: Int
    var price: Int
    var menufactureOfDate: Date
    
    init(name: String, volume: Int, price: Int, brand: String, date: String) {
        self.name = name
        self.brand = brand
        self.volume = volume
        self.price = price
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.dateFormat = "yyyyMMdd"
        let time = formatter.date(from: date)
        self.menufactureOfDate = time ?? Date()
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let datePrint = formatter.string(from: self.menufactureOfDate)
        return "\(name), \(volume)ml, \(price)원, \(brand), \(datePrint)"
    }
}
