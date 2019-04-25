//
//  Soda.swift
//  VendingMachine
//
//  Created by 김지나 on 04/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private let calorie: Int
    
    init(calorie: Int, brand: String, volume: Int, price: Int, productName: String, dateOfManufacture: Date = Date()) {
        self.calorie = calorie
        super.init(brand: brand, volume: volume, price: price, productName: productName, dateOfManufacture: dateOfManufacture, expirationDate: dateOfManufacture + 18144000)
    }
    
    func isHigh() -> Bool {
        return calorie > 400
    }
}


class Cola: Soda {
    enum company: String {
        case pepsi = "pepsi"
        case cocacola = "cocacola"
    }
    init(calorie: Int, brand: company, volume: Int, price: Int, productName: String, dateOfManufacture: Date) {
        super.init(calorie: calorie, brand: brand.rawValue, volume: volume, price: price, productName: productName, dateOfManufacture: dateOfManufacture)
    }
    
}
class Sider: Soda {
    private let carbonicAcidContent: Double
    init(carbonicAcidContent: Double) {
        self.carbonicAcidContent = carbonicAcidContent
        super.init(calorie: 200, brand: "롯데", volume: 250, price: 1500, productName: "칠성사이다", dateOfManufacture: Date())
    }
}
