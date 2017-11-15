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
    /// 유통기한: 제조일로부터 45일
    var expirationDate: Date? {
        guard let manufacturingDate = dateFormatter.date(from: self.dateOfManufacture) else {
            return nil
        }
        return Date(timeInterval: 3600 * 24 * 45, since: manufacturingDate)
    }
    /// 성분이 초기화 된 이후에 할당
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
    
    func valid(with date: Date) -> Bool {
        guard let expirationDay = self.expirationDate else {
            return false
        }
        return date < expirationDay ? true : false
    }

}

class StrawBerryMilk: Milk {}
class BananaMilk: Milk {}
class ChocolateMilk: Milk {}
