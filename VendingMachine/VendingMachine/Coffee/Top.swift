//
//  Top.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class Top: Coffee, Printable {
    private let productFamily: Top_Product_Family
    init(_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufactured_date: String,_ sizeType: CoffeeSize, _ productFamily: Top_Product_Family) {
        self.productFamily = productFamily
        super.init(brand, weight, price, name, manufactured_date, sizeType)
    }
    var description: String {
        return CoffeeTastes.top.description + Top.className + self.beverageDescription()
    }
    
    func printBeverage() {
        print(self.description)
    }
}

enum Top_Product_Family {
    case basic, coldbrew, simplieSmooth
}


