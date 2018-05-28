//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    
    private let kind = "BananaMilk"
    private let farmCode = "farmFresh"
    
    override init(_ brand: String, _ volume: Int, _ price: Int, _ name: String, _ date: Date) {
        super.init(brand, volume, price, name, date)
    }
    
    override var description: String {
        return "\(kind) - \(super.description)"
    }
    
    override func checkFarmCode() -> String {
        return self.farmCode
    }
}
