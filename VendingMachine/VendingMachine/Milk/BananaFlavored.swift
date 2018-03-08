//
//  BananaFlavored.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class Banana_Flavored_Milk: Milk, CustomStringConvertible, Printable {
    private var calorie: Float
    private var bananaConcentration: Float
    init(_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufactured_date: Date, _ milkGrades: MilkGrades, _ calorie: Float, _ bananaConcentration: Float) {
        self.calorie = calorie
        self.bananaConcentration = bananaConcentration
        super.init(brand, weight, price, name, manufactured_date, milkGrades)
    }
    
    var description: String {
        return MilkTastes.banana_Flavored.description + Banana_Flavored_Milk.className + self.beverageDescription()
    }
    
    func printBeverage() {
        print(self.description)
    }
    
    func isLowCalorie() -> Bool {
        return self.calorie < 40.0
    }
    
    func isHighBananaConcentration () -> Bool {
        return self.bananaConcentration > 1.0
    }
}
