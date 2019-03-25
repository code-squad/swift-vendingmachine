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
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedDate: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate
    }
    
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(changeDate(beforeDate: manufacturedDate))"
    }
    
    //출력을 위해 날짜 변경 해주는 함수
    func changeDate(beforeDate: Date) -> String {
        let dataForm = DateFormatter()
        dataForm.dateFormat = "yyyyMMdd"
        let afterDate = dataForm.string(from: beforeDate)
        return afterDate
    }
    
}
