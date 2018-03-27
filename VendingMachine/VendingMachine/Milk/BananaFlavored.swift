//
//  BananaFlavored.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class Banana: Milk {
    private let calorie: Float
    private let bananaConcentration: Float
    init(_ brand: String,
         _ weight: Int,
         _ price: Int,
         _ name: String,
         _ manufacturedDate: String,
         _ milk: Grades,
         _ calorie: Float,
         _ concentration: Float) {
        self.calorie = calorie
        self.bananaConcentration = concentration
        super.init(brand, weight, price, name, manufacturedDate, milk)
    }

    func isLowCalorie() -> Bool {
        return self.calorie < Standars.ofLowCalorie.rawValue
    }

    func isHighBananaConcentration () -> Bool {
        return self.bananaConcentration > Standars.ofHighConcentration.rawValue
    }
}
