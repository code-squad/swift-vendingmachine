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
    
    var infos: String {
        var result = "\n=>"
        bundles.forEach {
            guard let form = $0.getBundleTag({ (beverage, count) -> (String) in
                return " \(beverage.summary(isSelectable: false)) \(count)개"
            }) else { return }
            result += form
        }
        return result
    }
    
    var priceTags: String {
        var result = ""
        bundles.enumerated().forEach {
            let index = $0.offset + 1
            guard let form = $0.element.getBundleTag({ [index] (beverage, count) -> (String) in
                return "\n\(index)) \(beverage.summary(isSelectable: true)) \(count)개"
            }) else { return }
            result += form
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
