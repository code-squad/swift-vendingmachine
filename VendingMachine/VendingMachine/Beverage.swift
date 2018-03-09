//
//  Beverage.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible, Printable {
    private let brand: String
    private let weight: Int
    private let price: Int
    private let name: String
    private (set) var manufactured_date: String
    var expirationDate: Date? {
        guard let manufacturingDate = DateAndTime.formatter.date(from: self.manufactured_date) else {
            return nil
        }
        return Date(timeInterval: DateAndTime.twoWeeksAsSeconds, since: manufacturingDate)
    }
    
    init (_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufactured_date: String) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.manufactured_date = manufactured_date
    }
    
    var result: String {
        return self.className + self.description
    }
    
    var description: String {
        return  " - \(self.brand.description), \(self.weight.description)ml, \(self.price.description)원, \(self.name.description),\(self.manufactured_date)"
    }
    
    func isValidate() -> Bool {
        guard let expirationDay = self.expirationDate else {
            return false
        }
        let date = DateAndTime.formatter.date(from: self.manufactured_date) ?? Date()
        return date < expirationDay
    }
    
    func printBeverage() {
        print(self.result)
    }
}
    
protocol Printable {
    func printBeverage ()
}

extension Printable {
    var className: String {
        return String(describing: type(of: self))
    }
}
