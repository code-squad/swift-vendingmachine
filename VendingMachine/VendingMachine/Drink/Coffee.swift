//
//  Coffee.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Coffee: Drink {
    private(set) var isHot: Bool
    private(set) var amountOfCaffeine: Int
    private(set) var nameOfCoffeeBeans: String
    init?(calorie: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String,
          isHot: Bool,
          amountOfCaffeine: String,
          nameOfCoffeeBeans: String) {
        self.isHot = isHot
        guard let amountOfCaffeine = amountOfCaffeine.convertToInt(from: "mg") else {
            return nil
        }
        self.amountOfCaffeine = amountOfCaffeine
        self.nameOfCoffeeBeans = nameOfCoffeeBeans
        super.init(calorie: calorie,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture)
        self.typeOfProduct = "커피"
        // 제조일로부터 12개월
        self.maintenanceDay = 365
    }

    func isSuitableAmountOfCaffeine(to age: Int) -> Bool {
        if age > 19 && self.amountOfCaffeine == 400 {
            return true
        }
        if age <= 19 && self.amountOfCaffeine == 125 {
            return true
        }
        return false
    }

    func isLowCalorie() -> Bool {
        return self.calorie <= 30 ? true : false
    }

}
