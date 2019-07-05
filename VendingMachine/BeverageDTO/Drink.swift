//
//  Drink.swift
//  VendingMachine
//
//  Created by hw on 02/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Drink: Drinkable{
    private let brand: String
    private var quantity: Int
    private var price: Int
    private var drinkName: String
    private let validDate: Date
    
    init(brand: String, quantity: Int, price: Int, name: String, date: Date = Date.init()){
        self.brand = brand
        self.quantity = quantity
        self.price = price
        self.drinkName = name
        self.validDate = date
    }
    func display(printFormat: (Drinkable) -> Void) {
        printFormat(self)
    }
    var date : Date {
        get {
            return validDate
        }
    }
    func validate(with date:Date) -> Bool {
        let isValid = self.date > date ? true : false
        return isValid
    }
}

extension Drink: CustomStringConvertible {
    var description: String {
        var result = [String]()
        result.append(self.brand)
        result.append(String.init(format: "%d\(Units.millilter)", self.quantity))
        result.append(String.init(format: "%d\(Currency.won)", self.price))
        result.append(self.drinkName)
        result.append(CustomDateFormatter.convertDateToString(self.validDate))
        return "\(type(of: self)) - \(result.joined(separator: ", "))"
    }
}
