//
//  File.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 12..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

protocol BeveragePorotocol {
    func validate(with: Date) -> Bool
}

class Beverage: CustomStringConvertible {
    private var brand: String
    private var volume: Int
    private var price: Int
    private var name: String
    private (set) var manufacturingDate: Date
    var description: String {
        let date = DateFormatter()
        date.dateFormat = "yyyyMMdd"
        return "\(brand), \(volume)ml, \(price)원, \(name), \(date.string(from: manufacturingDate))"
    }
    init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: String) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        let date = DateFormatter()
        date.dateFormat = "yyyyMMdd"
        self.manufacturingDate = Date(timeInterval: DateInterval.today.rawValue, since:date.date(from: manufacturingDate)!)
    }
}
