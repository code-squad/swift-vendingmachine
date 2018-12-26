//
//  AddableBeverage.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 26..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum AddableBeverage: CaseIterable {
    case mandarineMilk
    case lactoseMilk
    case starbucksDoubleShot
    case topTheBlack
    case cocaCola
    case cocaColaZero
    
    var product: Beverage {
        get {
            switch self {
            case .mandarineMilk:
                return MandarineMilk()
            case .lactoseMilk:
                return LactoseFreeMilk()
            case .starbucksDoubleShot:
                return StarbucksDoubleShot()
            case .topTheBlack:
                return TOPTheBlack()
            case .cocaCola:
                return CocaCola()
            case .cocaColaZero:
                return CocaColaZero()
            }
        }
    }
}
