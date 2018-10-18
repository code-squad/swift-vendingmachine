//
//  Stocks.swift
//  VendingMachine
//
//  Created by 이동건 on 18/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Stocks {
    private var list: [Beverage]
    private var stocks: [[Beverage]] {
        let milks: [Milk] = list.compactMap { $0 as? Milk }
        let alcohols: [Alcohol] = list.compactMap { $0 as? Alcohol }
        let coffees: [Coffee] = list.compactMap { $0 as? Coffee }
        return [milks, alcohols, coffees]
    }
    
    var info: String {
        var result = ""
        stocks.forEach {
            guard let representation = $0.first else { return }
            result += " \(representation.summary(isSelectable: false, with: $0.count))"
        }
        return result
    }
    
    var priceTags: String {
        var result = ""
        stocks.enumerated().forEach {
            guard let representation = $0.element.first else { return }
            let prefix = "\($0.offset + 1)) "
            let info = "\(representation.summary(isSelectable: true, with: $0.element.count))"
            result += "\((prefix + info))\n"
        }
        return result
        
    }
    
    init(_ list: [Beverage]) {
        self.list = list
    }
    
    func append(_ beverage: Beverage) -> [[Beverage]] {
        list.append(beverage)
        return stocks
    }
}
