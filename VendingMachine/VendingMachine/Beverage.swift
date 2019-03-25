//
//  Beverage.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    
    private let brand: String
    private let volume: Int
    private let price: Int
    private let name: String
    private let manufacturedData: Date
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedData: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturedData = manufacturedData
    }
    
    var description: String {
        //서울우유, 200ml, 1000원, 날마다딸기우유, 20171009
        let dataForm = DateFormatter()
        dataForm.dateFormat = "yyyMMdd"
        let data = dataForm.string(from: manufacturedData)
        
        return "\(brand), \(volume)ml, \(price)원, \(name), \(data)"
    }
    
}
