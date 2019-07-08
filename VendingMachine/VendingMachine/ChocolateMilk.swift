//
//  ChocolateMilk.swift
//  VendingMachine
//
//  Created by jang gukjin on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    static let fattyContent: Double = 1.4
    
    init(){
        super.init(capacity: 260, price: 1800, name: "초코에몽", stringDate: "20190720", milkFarmCode: 63826)
    }
}
