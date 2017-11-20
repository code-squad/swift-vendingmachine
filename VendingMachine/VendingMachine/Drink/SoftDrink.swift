//
//  SoftDrink.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class SoftDrink: Drink {
    private(set) var amountOfSugar: Int
    // 제조일로부터 24개월
    override var expirationDate: Date? {
        guard let manufacturingDate = dateFormatter.date(from: self.dateOfManufacture) else {
            return nil
        }
        return Date(timeInterval: 3600 * 24 * 365 * 2, since: manufacturingDate)
    }

    init?(typeOfProduct: String,
          calorie: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String,
          amountOfSugar: String) {
        guard let amountOfSugar = amountOfSugar.convert(to: "g") else { return nil }
        self.amountOfSugar = amountOfSugar
        super.init(typeOfProduct: typeOfProduct,
                   calorie: calorie,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture)

    }

    func isSuitableAmountOfSugar() -> Bool {
        return self.amountOfSugar < 50 ? true : false
    }

}
