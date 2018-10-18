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
    private var stocks: [[Beverage] : Int] {
        let milks: [Milk] = list.compactMap { $0 as? Milk }
        let alcohols: [Alcohol] = list.compactMap { $0 as? Alcohol }
        let coffees: [Coffee] = list.compactMap { $0 as? Coffee }
        
        return [ milks: milks.count,
                alcohols : alcohols.count,
                coffees : coffees.count ]
    }
    
    init(_ list: [Beverage]) {
        self.list = list
    }
    
    func append(_ beverage: Beverage) -> [[Beverage] : Int] {
        list.append(beverage)
        return stocks
    }
}
