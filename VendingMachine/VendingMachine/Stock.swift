//
//  Stock.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 2. 1..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Stock: BeverageDisplayStand, CustomStringConvertible {
    var description: String {
        var result = ""
        result += "재고 디스크립션"
//        self.sortedItems.forEach { shelf in
//            result += "\(shelf.value[0].type) | \(shelf.value[0].getPrice())원 : \(shelf.value.count)개 \n"
//        }
        return result
    }
    private(set) var sortedItems = [ObjectIdentifier: [Beverage]]()

    init(sortedItems: [ObjectIdentifier: [Beverage]]) {
        self.sortedItems = sortedItems
    }

    func getKey() {

    }

}
