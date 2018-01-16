//
//  ChocolateMilk.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class ChocolateMilk : Milk {
    private var kind : String = "초코우유"
    
    override init(brand : String, name : String, volume : Int, price : Int, manufacturedDate : Date, expirationDate : Date) {
        super.init(brand: brand, name: name, volume: volume, price: price, manufacturedDate: manufacturedDate, expirationDate : expirationDate)
    }
    
    override var description : String {
        return "\(self.kind)(\(String(describing: ChocolateMilk.self)) - \(super.description)"
    }
}
