//
//  Milk.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private let category: Category

    enum Category: String {
        case strawberry = "딸기우유"
        case choco = "초코우유"
        case banana = "바나나우유"
    }

    init(category: Milk.Category, brand: String, weight: Int, price: Int, name: String) {
        self.category = category
        super.init(brand: brand, weight: weight, price: price, name: name)
    }


    override var description: String {
        return "\(category.rawValue) - " + super.description
    }

}
