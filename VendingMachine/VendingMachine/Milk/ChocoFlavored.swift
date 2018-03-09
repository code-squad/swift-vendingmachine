//
//  ChocoFlavored.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class ChocoFlavoredMilk: Milk, CustomStringConvertible, Printable {
    private let calorie: Float
    private let chocolateConcentration: Float
    init(_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufactured_date: String, _ milkGrades: MilkGrades, _ calorie: Float, _ chocolateConcentration: Float) {
        self.calorie = calorie
        self.chocolateConcentration = chocolateConcentration
        super.init(brand, weight, price, name, manufactured_date, milkGrades)
    }
    
    var description: String {
        return MilkTastes.chocolate_Flavored.description + ChocoFlavoredMilk.className + self.beverageDescription()
    }
    
    func printBeverage() {
        print(self.description)
    }
    
    func isLowCalorie() -> Bool {
        return self.calorie < 40.0
    }
    
    func isHighChocolateConcentration () -> Bool {
        return self.chocolateConcentration > 1.0
    }
}

