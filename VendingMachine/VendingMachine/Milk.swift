//
//  Milk.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    
    private let kind: Kind
    
    init(_ kind: Kind,_ brand: String,_ volume: Int,_ price: Int,_ name: String,_ date: Date) {
        self.kind = kind
        super.init(brand, volume, price, name, date)
    }
}

extension Milk {
    
    enum Kind: CustomStringConvertible {
        case strawberry, choco, banana
        
        var description: String {
            switch self {
            case .strawberry: return "딸기우유"
            case .choco: return "초코우유"
            case .banana: return "바나나우유"
            }
        }
    }
}
