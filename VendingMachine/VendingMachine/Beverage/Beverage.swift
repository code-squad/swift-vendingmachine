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
    private let manufacturedDate: Date
    private let endDate: EndDate
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedDate: Date , endDate: EndDate) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate
        self.endDate = endDate
    }
    
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(Date.changeDate(beforeDate: manufacturedDate)))"
    }
    
    // 클래스 명을 출력하기 위한
    var className: String {
        return String(describing: type(of: self))
    }
    
    //유통기한
    func isEqualExpirationDate() -> Bool {
        let expirationDate = Date.addDate(addDay: endDate.rawValue, day: manufacturedDate)
        return Date.isEqualDate(manufacturedDate: expirationDate)
    }
}

