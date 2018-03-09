//
//  Coffee.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class Coffee: Beverage {
    private var sizeType: CoffeeSize = .short
    init(_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufactured_date: String, _ sizeType: CoffeeSize) {
        self.sizeType = .short
        super.init(brand, weight, price, name, manufactured_date)
        self.sizeType = getSize(weight)
    }
    
    override var expirationDate: Date? {
        guard let manufacturingDate = dateFormatter.date(from: self.manufactured_date) else {
            return nil
        }
        return Date(timeInterval: 3600 * 24 * 60, since: manufacturingDate)
    }
    
    func getSize(_ weight: Int) -> CoffeeSize {
        return CoffeeSize(rawValue: weight) ?? .short
    }
}

enum CoffeeTastes: CustomStringConvertible {
    case americano
    case top
    case dutchCoffeeStory
    case letsBe
    var description: String {
        switch self {
        case .americano: return "아메리카노"
        case .top: return "티오피"
        case .dutchCoffeeStory: return "더치커피스토리"
        case .letsBe: return "레츠비"
        }
    }
}

enum CoffeeSize: Int {
    case short = 240, tall = 350, grande = 470, venti = 590
}
