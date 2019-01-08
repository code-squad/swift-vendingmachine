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
    
    init(name: String, volume: Int, brand: String, date: String, caffeineAmount: Double, topKind: TOPKind) {
        self.topKind = topKind
        super.init(name: name, volume: volume, price: 3500, brand: brand, date: date, caffeineAmount: caffeineAmount)
    }
    
    func isAmericano() -> Bool {
        return topKind == .sweetAmericano
    }
    
    func isLatte() -> Bool {
        return topKind == .latte
    }
    
    func isBlack() -> Bool {
        return topKind == .black
    }
    
//    override func getTypeWhatCanBuy(coin: Coin) -> String? {
//        if coin.isEnoughToBuy(of: self.price) { return convertToStringBeverage() }
//        else { return nil }
//    }
    
    override func searchDrinkNumber() -> Int {
        return 6
    }
    
    override func convertToStringBeverage() -> String {
        return "\(type(of: self))"
    }
}
