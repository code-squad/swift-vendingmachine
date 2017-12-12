//
//  ChocoMilk.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 12..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class ChocoMilk: Milk {
    private(set) var ingredients: String
    override init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int?, manufacturerCode: Int, packingMaterial: String?) {
        self.ingredients = "코코아분말"
        super.init(brand, volume, price, productName, manufacturedDate, expirationDate, calories, manufacturerCode: manufacturerCode, packingMaterial: packingMaterial)
    }
}
