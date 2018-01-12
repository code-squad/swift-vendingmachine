//
//  Coke.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coke: Soda {
    private var kindOfSoda: String = "콜라"
    private var calorie: Int = 110
    init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date, calorie: Int) {
        self.calorie = calorie
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
    }
    override var description: String {
        return "\(self.kindOfSoda)(Coke)\(super.description)"
    }
    
    func isLowCalorie() -> Bool {
        return calorie < 80
    }
}
