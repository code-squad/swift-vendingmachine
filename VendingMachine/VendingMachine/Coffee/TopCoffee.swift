//
//  TopCoffee.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 12..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class TopCoffee: Coffee {
    private(set) var ingredients: String
    override init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, caffeineLevels: Int, isHot: Bool?, isSweetened: Bool?, expirationDate: Date, calories: Int?) {
        self.ingredients = "커피추출액(콜럼비아산)"
        super.init(brand, volume, price, productName, manufacturedDate, caffeineLevels: caffeineLevels, isHot: isHot, isSweetened: isSweetened, expirationDate: expirationDate, calories: calories)
    }
}
