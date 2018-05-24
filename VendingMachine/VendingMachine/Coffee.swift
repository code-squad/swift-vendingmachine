//
//  Coffee.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    
    private let kind: Kind
    
    init(_ kind: Kind,_ brand: String, _ volume: Int, _ price: Int, _ name: String, _ date: Date) {
        self.kind = kind
        super.init(brand, volume, price, name, date)
    }
    
}

extension Coffee {
    enum Kind: CustomStringConvertible {
        case top, cantata, georgia
        
        var description: String {
            switch self {
            case .top: return "티오피"
            case .cantata: return "칸타타"
            case .georgia: return "조지아"
            }
        }
    }
}
