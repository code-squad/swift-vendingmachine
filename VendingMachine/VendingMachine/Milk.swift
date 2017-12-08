//
//  Milk.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var validate: Date

    init(brand: String, weight: Int, price: Int, name: String, validate: String) {
        self.validate = Milk.getDateFromString(validate: validate)
        super.init(brand: brand, weight: weight, price: price, name: name)
    }

    private static func getDateFromString(validate: String) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = Int(validate.prefix(4))!
        dateComponents.month = Int(validate.suffix(4).prefix(2))!
        dateComponents.day = Int(validate.suffix(2))
        dateComponents.timeZone = TimeZone(abbreviation: "KST")
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        return date
    }

    func validate(with data: Date) -> Bool {
        return data < validate
    }

}
