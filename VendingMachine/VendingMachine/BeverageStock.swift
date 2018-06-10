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
}

enum BeverageName {
    case top
    case cantata
    case georgia
    case strawberryMilk
    case chocoMilk
    case coke
    case sprite
}
