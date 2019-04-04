//
//  Beverage.swift
//  VendingMachine
//
//  Created by 김지나 on 01/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// CustomStringConvertible : 모델 객채를 화면이나 디버깅 코드에 표시할 때, 텍스트적인 표현을 생성할 때 사용
// 특정 타입을 String으로 표현
class Beverage: CustomStringConvertible {
    private let brand: String
    private let capacity: Int
    private let price: Int
    private let productName: String
    private let dateOfManufacture: Date
    
    init(brand: String, capacity: Int, price: Int, productName: String, dateOfManufacture: Date = Date()) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.productName = productName
        self.dateOfManufacture = dateOfManufacture
        
    }
    
    // Date()의 결과를 원하는 형태로 출력되도록 포맷
    var description: String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyyMMdd"
        let date = dateFormat.string(from: dateOfManufacture)
        
        return "\(brand), \(capacity)ml, \(price)원, \(productName), \(date)"
    }
}




