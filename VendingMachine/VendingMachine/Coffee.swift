//
//  Coffee.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    let category: Category

    enum Category: String {
        case top = "T.O.P"
        case kantata = "칸타타"
        case georgia = "조지아"
    }

    init(category: Coffee.Category, brand: String, weight: Int, price: Int, name: String) {
        self.category = category
        super.init(brand: brand, weight: weight, price: price, name: name)
    }


    override var description: String {
        return "\(category.rawValue) - " + super.description
    }

}
