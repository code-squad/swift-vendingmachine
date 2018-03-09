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
    init(_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufactured_date: String, _ amountOfSugar: Float) {
        self.amountOfSugar = amountOfSugar
        super.init(brand, weight, price, name, manufactured_date)
    }
    
    override var expirationDate: Date? {
        guard let manufacturingDate = dateFormatter.date(from: self.manufactured_date) else {
            return nil
        }
        return Date(timeInterval: 3600 * 24 * 120, since: manufacturingDate)
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
