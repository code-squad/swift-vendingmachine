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
    
    init(name: String, volume: Int, brand: String, date: String, caffeineAmount: Double, material: PackingMaterial) {
        self.packingMaterial = material
        super.init(name: name, volume: volume, price: 3000, brand: brand, date: date, caffeineAmount: caffeineAmount)
    }
    
    func isCanPacking() -> Bool {
        return packingMaterial == .cans
    }
    
    func isPlasticPacking() -> Bool {
        return packingMaterial == .plastic
    }
    
    override func canBuyThisCoin(coin: Int) -> String? {
        if coin >= price { return "Cantata" }
        else { return nil }
    }
    
    override func searchDrinkNumber() -> Int {
        return 5
    }
}
