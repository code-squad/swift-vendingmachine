//
//  Drink.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Drink: NSObject {
    private(set) var productTpye: String
    private(set) var calorie: Int
    private(set) var brand: String
    private(set) var weight: String
    private(set) var price: String
    private(set) var name: String
    private(set) var dateOfManufacture: String
    override var description: String {
        return String(format: "%@(%@) - %@, %@, %@, %@, %@",
                      self.productTpye,
                      self.className,
                      self.brand,
                      self.weight,
                      self.price,
                      self.name,
                      self.dateOfManufacture)
    }

    init?(productTpye: String,
          calorie: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String) {
        self.productTpye = productTpye
        guard let kiloCalorie = calorie.convert(to: "kcal") else { return nil }
        self.calorie = kiloCalorie
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
    }
}

extension NSObject {
    var className: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last!
    }
    
    class var className: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}

