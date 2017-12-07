//
//  Milk.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage, CustomStringConvertible {
    let category: Category

    enum Category: String {
        case strawberry = "딸기우유"
        case choco = "초코우유"
        case banana = "바나나우유"
    }

    init(category: Milk.Category, brand: String, weight: Int, price: Int, name: String) {
        self.category = category
        super.init(brand: brand, weight: weight, price: price, name: name)
    }


    var description: String {
        return "\(category.rawValue) - \(brand), \(weight)ml, \(price)원, \(name), \(getStringFromDate(date: dateOfManufacture))"
    }

    private func getStringFromDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: date)
    }

}
