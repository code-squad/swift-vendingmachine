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
    private var bundles: [BeverageBundle] {
        let group = Dictionary(grouping: list, by: { $0.className })
        let bundles = group.values.map { BeverageBundle($0) }
        return bundles
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
    
    func append(_ beverage: Beverage) -> [BeverageBundle] {
        list.append(beverage)
        return bundles
    }
}
