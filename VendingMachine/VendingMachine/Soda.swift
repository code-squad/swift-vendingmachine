//
//  Soda.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Soda: Beverage {
    let category: Category

    enum Category: String {
        case coke = "콜라"
        case sprite = "사이다"
        case fanta = "환타"
    }

    init(category: Soda.Category, brand: String, weight: Int, price: Int, name: String) {
        self.category = category
        super.init(brand: brand, weight: weight, price: price, name: name)
    }


    override var description: String {
        return "\(category.rawValue) - " + super.description
    }

}
