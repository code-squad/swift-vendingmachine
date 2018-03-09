//
//  Beverage.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage {
    private let brand: String
    private let weight: Int
    private let price: Int
    private let name: String
    private (set) var manufactured_date: String
    var expirationDate: Date? {
        guard let manufacturingDate = dateFormatter.date(from: self.manufactured_date) else {
            return nil
        }
        return Date(timeInterval: 3600 * 24 * 14, since: manufacturingDate)
    }
    
    let minute:TimeInterval = 60.0
    let hour:TimeInterval = 60.0 * 60.0
    let day:TimeInterval = 24 * 3600
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        formatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        return formatter
    }()
    init (_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufactured_date: String) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.manufactured_date = manufactured_date
    }
    
    func beverageDescription () -> String {
        return " - \(self.brand.description), \(self.weight.description)ml, \(self.price.description)원, \(self.name.description),\(self.manufactured_date)"
    }
    
    func isValidate() -> Bool {
        guard let expirationDay = self.expirationDate else {
            return false
        }
        let date = dateFormatter.date(from: self.manufactured_date) ?? Date()
        return date < expirationDay
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
