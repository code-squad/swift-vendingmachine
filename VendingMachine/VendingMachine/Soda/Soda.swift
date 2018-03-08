//
//  Soda.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class Soda: Beverage {
    private var amountOfSugar: Float = 0.0
    init(_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufactured_date: Date, _ amountOfSugar: Float) {
        self.amountOfSugar = amountOfSugar
        super.init(brand, weight, price, name, manufactured_date)
    }
    
    func isHighSugarcontent () -> Bool {
        return self.amountOfSugar > 50
    }
}

enum SodaTastes: CustomStringConvertible {
    case coke
    case welchs
    case fanta_Pineapple_Flavored
    var description: String {
        switch self {
        case .coke: return "콜라"
        case .welchs: return "웰치스"
        case .fanta_Pineapple_Flavored: return "파인맛환타"
        }
    }
}
