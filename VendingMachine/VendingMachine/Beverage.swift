//
//  Beverage.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage {
    private var brand: String
    private var weight: Int
    private var price: Int
    private var name: String
    private var manufactured_date: Date = Date()
    init (_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufactured_date: Date) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.manufactured_date = manufactured_date
    }
    
    func beverageDescription () -> String {
        return " - \(self.brand.description), \(self.weight.description)ml, \(self.price.description)원, \(self.name.description),\(getStringDate(wantedDay: self.manufactured_date))"
    }
    
    func getStringDate (wantedDay: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        return dateFormatter.string(from: wantedDay)
    }
    
    func isValidate() -> Bool {
        return self.manufactured_date + 14 <= Date()
    }
}

protocol Printable {
    func printBeverage ()
    static var className: String { get }
}

extension Printable {
    static var className: String {
        let type = String(describing: self)
        return "(\(type))"
    }
}
