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
    init(_ brand: String,
         _ weight: Int,
         _ price: Int,
         _ name: String,
         _ manufacturedDate: String,
         _ amountOfSugar: Float) {
        self.amountOfSugar = amountOfSugar
        super.init(brand, weight, price, name, manufacturedDate)
    }

    override var expirationDate: Date? {
        guard let manufacturingDate = DateAndTime.formatter.date(from: self.manufacturedDate) else {
            return nil
        }
        return Date(timeInterval: DateAndTime.sixMonthAsSeconds, since: manufacturingDate)
    }

    func isHighSugarcontent () -> Bool {
        return self.amountOfSugar > 50
    }

}

enum SodaTastes: CustomStringConvertible {
    case coke
    case welchs
    case fantaPineappleFlavored
    var description: String {
        switch self {
        case .coke: return "콜라"
        case .welchs: return "웰치스"
        case .fantaPineappleFlavored: return "파인맛환타"
        }
    }
}
