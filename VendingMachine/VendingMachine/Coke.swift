//
//  Coke.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Coke: SoftDrink {
    func isZeroCoke() -> Bool {
        return self.calorie < 4 ? true : false
    }
    
}
