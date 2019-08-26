//
//  Beverage.swift
//  VendingMachine
//
//  Created by Daheen Lee on 29/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    private let manufacturer: String
    private let dateOfManufactured: Date
    private let expirationDate: Date
    private let capacity: Measurement<UnitVolume>
    private let price: Int
    private let brand: String
    private let name: String
    
    var duration: DateInterval {
        return DateInterval(start: dateOfManufactured, end: expirationDate)
    }
    
    func validate(with date: Date) -> Bool {
        return duration.contains(date)
    }
    
    init(manufacturer: String,
         dateOfManufactured: String,
         expirationDate: String,
         brand: String,
         name: String,
         capacity: Int,
         unit: UnitVolume,
         price: Int) {
        
        self.manufacturer = manufacturer
        self.dateOfManufactured = Date(string: dateOfManufactured)
        self.expirationDate = Date(string: expirationDate)
        self.brand = brand
        self.name = name
        self.capacity = Measurement(value: Double(capacity), unit: unit)
        self.price = price
    }
    
    var productName: String {
        return "\(brand) \(name)"
    }
    
    var description: String {
        let formattedDate = DateConverter.toString(from: dateOfManufactured)
        return "\(type(of: self)) - \(self.manufacturer), \(self.capacity), \(self.price)원, \(self.productName), \(formattedDate)"
    }
}
