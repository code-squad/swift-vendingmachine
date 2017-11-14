//
//  Milk.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Milk: Drink {
    var farmCode: String
    var ingredients: [String]
    lazy var isEasyOfDigestion: () -> Bool = {
        if self.ingredients.contains("lactos") {
            return false
        }
        return true
    }
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyymmdd"
        formatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        return formatter
    }()
    
    init(productTpye: String,
         brand: String,
         weight: String,
         price: String,
         name: String,
         dateOfManufacture: String,
         farmCode: String = "Unknown",
         ingredients: [String] = [String]()) {
        self.farmCode = farmCode
        self.ingredients = ingredients
        super.init(productTpye: productTpye,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture)
    }
    
    // 유통기한: 제조일로부터 45일
    func valid(with date: Date) -> Bool {
        // date - 제조일이 <= 45
        guard let manufacturingDate = dateFormatter.date(from: self.dateOfManufacture) else {
            return false
        }
        let compareDate = date.timeIntervalSince(manufacturingDate)
        let compareDay = compareDate / (3600 * 24)
        if compareDay <= 45 {
            return true
        }
        return false
    }

}

class StrawBerryMilk: Milk {}
class BananaMilk: Milk {}
class ChocolateMilk: Milk {}
