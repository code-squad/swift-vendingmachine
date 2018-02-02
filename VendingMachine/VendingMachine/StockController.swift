//
//  Stock.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 2. 1..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Stock: CustomStringConvertible {
    var description: String {
        var result = ""
        self.sets.forEach { shelf in
            result += "\(shelf.value[0].type) : \(shelf.value.count)개 \n"
        }

        return result
    }

    private var sets = [ObjectIdentifier: [Beverage]]()

    init (sets: [ObjectIdentifier: [Beverage]]) {
        self.sets = sets
    }

    func setAsDictionary (_ beverages: [Beverage]) -> [ObjectIdentifier: [Beverage]] {
        let stockSets = beverages.reduce(into: [ObjectIdentifier: [Beverage]]()) {
            $0[ObjectIdentifier(type(of: $1)), default:[]].append($1)
        }
    return stockSets
    }
}
