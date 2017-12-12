//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 12..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    private let ingredients: String
    override init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, _ manufacturerCode: Int, isHot: Bool?, packingMaterial: String?, expirationDate: Date, calories: Int?) {
        self.ingredients = "바나나농축액"
        super.init(brand, volume, price, productName, manufacturedDate, manufacturerCode, isHot: isHot, packingMaterial: packingMaterial, expirationDate: expirationDate, calories: calories)
    }
}
