//
//  ChocoFlavored.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class ChocoFlavoredMilk: Milk {
    private let calorie: Float
    private let chocolateConcentration: Float
    init(_ brand: String,
         _ weight: Int,
         _ price: Int,
         _ name: String,
         _ manufacturedDate: String,
         _ milkGrades: Grades,
         _ calorie: Float,
         _ chocolateConcentration: Float) {
        self.calorie = calorie
        self.chocolateConcentration = chocolateConcentration
        super.init(brand, weight, price, name, manufacturedDate, milkGrades)
    }
    func isLowCalorie() -> Bool {
        return self.calorie < Standars.ofLowCalorie.rawValue
    }

    func isHighChocolateConcentration () -> Bool {
        return self.chocolateConcentration > Standars.ofHighConcentration.rawValue
    }
}
