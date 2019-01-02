//
//  Cantata.swift
//  VendingMachine
//
//  Created by 윤동민 on 28/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum PackingMaterial {
    case cans
    case plastic
}

class Cantata: Coffee {
    private var packingMaterial: PackingMaterial
    
    init(name: String, volume: Int, price: Int, brand: String, date: String, caffeineAmount: Double, material: PackingMaterial) {
        self.packingMaterial = material
        super.init(name: name, volume: volume, price: price, brand: brand, date: date, caffeineAmount: caffeineAmount)
    }
    
    func isCanPacking() -> Bool {
        guard packingMaterial == .cans else { return false }
        return true
    }
    
    func isPlasticPacking() -> Bool {
        guard packingMaterial == .plastic else { return false }
        return true
    }
}
