//
//  Bundles.swift
//  VendingMachine
//
//  Created by 이동건 on 23/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Bundles {
    private var bundles: [Bundle]
    var count: Int {
        return bundles.count
    }
    
    init(_ bundles: [Bundle]) {
        self.bundles = bundles
    }
    
    func get(at index: Int) throws -> Beverage {
        if index <= 0 { throw VendingMachineError.wrongInput }
        return bundles[index - 1].beverage
    }
    
    func display(_ handler: (_ offset: Int, _ beverage: Beverage, _ count: Int)->(String)) -> String {
        var result = ""
        bundles.enumerated().forEach {
            result += handler($0.offset, $0.element.beverage, $0.element.count)
        }
        return result
    }
}
