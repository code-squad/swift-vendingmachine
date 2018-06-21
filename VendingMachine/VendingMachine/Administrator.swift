//
//  Administrator.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 21..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Administrator {
    
    static func makeBeverage(_ menuNumber: Int) -> Beverage? {
        switch menuNumber {
        case 1:
            return TOP()
        case 2:
            return Cantata()
        case 3:
            return Georgia()
        case 4:
            return StrawberryMilk()
        case 5:
            return ChocoMilk()
        case 6:
            return Coke()
        case 7:
            return Sprite()
        default:
            return nil
        }
    }
}
