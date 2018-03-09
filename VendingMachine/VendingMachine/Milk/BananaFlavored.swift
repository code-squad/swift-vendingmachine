//
//  BananaFlavored.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class BananaFlavoredMilk: Milk {
    private let calorie: Float
    private let bananaConcentration: Float
    init(_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufactured_date: String, _ milkGrades: MilkGrades, _ calorie: Float, _ bananaConcentration: Float) {
        self.calorie = calorie
        self.bananaConcentration = bananaConcentration
        super.init(brand, weight, price, name, manufactured_date, milkGrades)
    }
    
    func isLowCalorie() -> Bool {
        return self.calorie < Standars.ofLowCalorie.rawValue
    }
    
    func isHighBananaConcentration () -> Bool {
        return self.bananaConcentration > Standars.ofHighConcentration.rawValue
    }
}
