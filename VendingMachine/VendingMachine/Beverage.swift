//
//  Beverage.swift
//  VendingMachine
//
//  Created by 윤지영 on 11/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Beverage: NSObject {
    private let brand: String
    private let name: String
    private let volume: Int
    private let price: Int
    private let dateOfManufacture: Date

    init(brand: String, name: String, volume: Int, price: Int, dateOfManufacture: Date) {
        self.brand = brand
        self.name = name
        self.volume = volume
        self.price = price
        self.dateOfManufacture = dateOfManufacture
    }

    override var description: String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyyMMdd"
        let date = dateFormat.string(from: dateOfManufacture)
        return "\(brand), \(name), \(volume)ml, \(price)원, \(date)"
    }

}
