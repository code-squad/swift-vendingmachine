//
//  Top.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class TOPCoffee : Coffee {
    private var kind : String = "TOP커피"
    
    override init(brand : String, name : String, volume : Int, price : Int, manufacturedDate : Date, hot : Bool) {
        super.init(brand: brand, name: name, volume: volume, price: price, manufacturedDate: manufacturedDate, hot : hot)
    }

    override var description : String {
        return "\(self.kind)(\(String(describing: TOPCoffee.self)) - \(super.description)"
    }
}
