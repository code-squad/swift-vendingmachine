//
//  BeverageStock.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct BeverageStock: Equatable {
    
    var beverageStock: [BeverageName:BeverageList] = [BeverageName:BeverageList]()
    
    mutating func add(_ beverage: Beverage) throws {
        let beverageType = String(beverage.description.split(separator: ",").first ?? "")
        guard let beverageName = BeverageName(rawValue: beverageType) else {
            throw Error.invalidBeverageType
        }
        
        if var beverageList = self.beverageStock[beverageName] {
            beverageList.add(beverage)
        } else {
            var newBeverageList = BeverageList()
            newBeverageList.add(beverage)
            self.beverageStock[beverageName] = newBeverageList
        }
    }
}

enum BeverageName: String {
    case TOP
    case Cantata
    case Georgia
    case StrawberryMilk
    case ChocoMilk
    case Coke
    case Sprite
}

extension BeverageStock {
    
    enum Error: Swift.Error {
        case invalidBeverageType
        
        var errorMessage: String {
            switch self {
            case .invalidBeverageType:
                return "자판기 없는 음료입니다."
            }
        }
    }
}
