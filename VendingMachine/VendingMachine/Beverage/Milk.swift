//
//  Milk.swift
//  VendingMachine
//
//  Created by 김지나 on 04/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private let grade: String
    
    init(grade: String, brand: String, capacity: Int, price: Int, productName: String, dateOfManufacture: Date = Date()) {
        self.grade = grade
        super.init(brand: brand, capacity: capacity, price: price, productName: productName, dateOfManufacture: dateOfManufacture)
    }
    
    func isGradeA() -> Bool {
        return grade == "A"
    }
}
