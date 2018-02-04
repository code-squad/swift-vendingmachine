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
        self.itemSet.forEach { shelf in
            result += "\(shelf.value[0].type) | \(shelf.value[0].getPrice()) : \(shelf.value.count)개 \n"
        }
        return result
    }
    private(set) var itemSet = [ObjectIdentifier: [Beverage]]()

    init(items: [ObjectIdentifier: [Beverage]]) {
        self.itemSet = items
    }


}
