//
//  TOP.swift
//  VendingMachine
//
//  Created by 윤동민 on 28/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum TOPKind {
    case sweetAmericano
    case latte
    case black
}

class TOP: Coffee {
    private var topKind: TOPKind
    
    init(name: String, volume: Int, price: Int, brand: String, date: String, caffeineAmount: Double, topKind: TOPKind) {
        self.topKind = topKind
        super.init(name: name, volume: volume, price: price, brand: brand, date: date, caffeineAmount: caffeineAmount)
    }
    
    func isAmericano() -> Bool {
        guard topKind == .sweetAmericano else { return false }
        return true
    }
    
    func isLatte() -> Bool {
        guard topKind == .latte else { return false }
        return true
    }
    
    func isBlack() -> Bool {
        guard topKind == .black else { return false }
        return true
    }
}
