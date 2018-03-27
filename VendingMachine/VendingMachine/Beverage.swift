//
//  Beverage.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: NSObject {
    private let brand: String
    private let weight: Int
    let price: Int
    private (set) var name: String
    private (set) var manufacturedDate: String
    var expirationDate: Date? {
        guard let manufacturingDate = DateAndTime.formatter.date(from: self.manufacturedDate) else {
            return nil
        }
        return Date(timeInterval: DateAndTime.twoWeeksAsSeconds, since: manufacturingDate)
    }

    init (_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufacturedDate: String) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate
    }

    private  var result: String {
        return objectName + self.description
    }

    func isValidate() -> Bool {
        guard let expirationDay = self.expirationDate else {
            return false
        }
        return Date() < expirationDay
    }

    func isAffordable(_ userMoney: Int) -> Bool {
        return self.price <= userMoney
    }

     private var objectName: String {
        return String(describing: type(of: self))
    }
}
