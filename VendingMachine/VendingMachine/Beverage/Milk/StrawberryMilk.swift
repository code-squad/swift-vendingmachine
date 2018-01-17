//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class StrawberryMilk : Milk {
    private var kind : String = "딸기우유"
    
    override init(brand : String, name : String, volume : Int, price : Int, manufacturedDate : Date) {
        super.init(brand: brand, name: name, volume: volume, price: price, manufacturedDate: manufacturedDate)
    }
    
    override var description : String {
        return "\(self.kind)(\(String(describing: StrawberryMilk.self))) - \(super.description)"
    }

}
