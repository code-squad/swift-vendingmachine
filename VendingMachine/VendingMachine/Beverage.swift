//
//  Beverage.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

protocol Drinkable {

}

class Beverage: Drinkable {
    // 브랜드(String), 무게(Int), 가격(Int), 이름(String), 제조일자(Date)
    private let brand: String
    private let weight: Int
    private let price: Int
    private let productName: String
    private let manufacturedDate: Date
    init(brand: String, weight: Int, price: Int, productName: String, manufacturedDate: Date) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.productName = productName
        self.manufacturedDate = manufacturedDate
    }
}
