//
//  RealBananaMilk.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class RealBananaMilk: Milk {
    private let bananMilkColor: String
    private let flavor: String
    init(volume: Int, price: Int, manufacturingDate: String) {
        self.bananMilkColor = "WHITE"
        self.flavor = "바나나향"
        super.init(kind: "바나나", fatContent: 7, brand: "매일우유", volume: volume, price: price, name: "바나나는 원래 하얗다", manufacturingDate: manufacturingDate)
    }
    override var description: String {
        return "\(super.kind)우유(\(String(describing: type(of: self)))) - " + super.description
    }
    
    func isRealBanana() -> Bool {
        return bananMilkColor == "WHITE"
    }
    
    func hasBananaFlavor() -> Bool {
        return flavor == "바나나향"
    }
    
}
