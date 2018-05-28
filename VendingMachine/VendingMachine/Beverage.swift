//
//  Beverage.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible, Validate {
    
    private let brand: String
    private let volume: Int
    private let price: Int
    private let name: String
    private let date: Date
    
    init(_ brand: String,_ volume: Int,_ price: Int,_ name: String,_ date: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.date = date
    }
    
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return "\(self.brand), \(self.volume)ml, \(self.price)원, \(self.name), \(dateFormatter.string(from: self.date))"
    }
    
    func validate(_ today: Date) -> Bool {
        return today < self.date
    }
    
    
}
