//
//  Drink.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Drink: NSObject {
    private(set) var typeOfProduct: String
    private(set) var calorie: Int
    private(set) var brand: String
    private(set) var weight: String
    private(set) var price: Int
    private(set) var name: String
    private(set) var dateOfManufacture: String
    var expirationDate: Date? {
        return nil
    }
    override var description: String {
        return String(format: "%@(%@) - %@, %@, %d원, %@, %@",
                      self.typeOfProduct,
                      self.className,
                      self.brand,
                      self.weight,
                      self.price,
                      self.name,
                      self.dateOfManufacture)
    }
    
    init?(typeOfProduct: String,
          calorie: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String) {
        self.typeOfProduct = typeOfProduct
        guard let kiloCalorie = calorie.convert(to: "kcal"),
            let price = price.convert(to: "원") else {
                return nil
        }
        self.calorie = kiloCalorie
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
    }
    
    func valid(with date: Date) -> Bool {
        guard let expirationDay = self.expirationDate else {
            return false
        }
        return date < expirationDay ? true : false
    }

}

extension NSObject {
    var className: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last!
    }
    
    class var className: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    
    var typeName: String {
        var typeName = ""
        switch self {
        case is Milk:
            typeName = Milk.className()
        case is SoftDrink:
            typeName = SoftDrink.className()
        case is Coffee:
            typeName  = Coffee.className()
        default:
            typeName = self.className
        }
        return typeName
    }
}

extension Drink: Comparable {
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.typeName == rhs.typeName && lhs.typeOfProduct == rhs.typeOfProduct
    }
    
    static func < (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.typeName < rhs.typeName ||
            (lhs.typeName == rhs.typeName && lhs.typeOfProduct < rhs.typeOfProduct)
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd"
    formatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
    return formatter
}()
