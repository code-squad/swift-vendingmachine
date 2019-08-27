//
//  beverage.swift
//  VendingMachine
//
//  Created by JieunKim on 27/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class beverage: CustomStringConvertible {
    private var brand: String = ""
    private var capacity: Int = 0
    private var price: Int = 0
    private var name: String = ""
    private let manufactureDate: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, manufactureDate: Date) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufactureDate = manufactureDate
    }
    
    var description: String {
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "yyyyMMdd"
        let date = dateFormate.string(from: manufactureDate)
        return "\(brand),\(capacity)ml, \(price)원, \(name), \(date)"
    }
    
}
