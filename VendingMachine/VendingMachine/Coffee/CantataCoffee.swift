//
//  CantataCoffee.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 12..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class CantataCoffee: Coffee {
    private(set) var ingredients: String
    override init(caffeineLevels: Int, isHot: Bool?, isSweetened: Bool?, expirationDate: Date, calories: Int?, _ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date) {
        self.ingredients = "커피농축액(브라질산)"
        super.init(caffeineLevels: caffeineLevels, isHot: isHot, isSweetened: isSweetened, expirationDate: expirationDate, calories: calories, brand, volume, price, productName, manufacturedDate)
    }
}
