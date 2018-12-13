//
//  SoftDrink.swift
//  VendingMachine
//
//  Created by 윤지영 on 11/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class SoftDrink: Beverage, Groupable {

    var group: BeverageCategory {
        return .softDrink
    }

}
