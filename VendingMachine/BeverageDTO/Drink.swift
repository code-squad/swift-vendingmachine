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
    private let quantity: Int
    private let price: Int
    private let drinkName: String
    private let manufactureDate: Date
    
    init(brand: String, quantity: Int, price: Int, name: String, date: Date){
        self.brand = brand
        self.quantity = quantity
        self.price = price
        self.drinkName = name
        self.manufactureDate = Date.init()
    }
    func display(printFormat: (Drinkable) -> Void) {
        printFormat(self)
    }
}

extension Drink: CustomStringConvertible {
    var description: String {
        var result = [String]()
        result.append(self.brand)
        result.append(String.init(format: "%d\(Units.millilter)", self.quantity))
        result.append(String.init(format: "%d\(Units.won)", self.price))
        result.append(self.drinkName)
        result.append(CustomDateFormatter.convertDateToString(self.manufactureDate))
        return result.joined(separator: ", ")
    }
}
