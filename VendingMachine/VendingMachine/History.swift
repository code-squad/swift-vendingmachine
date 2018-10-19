//
//  History.swift
//  VendingMachine
//
//  Created by 이동건 on 19/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class History {
    typealias PurchaseHistory = (beverage: Beverage, date: Date)
    
    private var list: [PurchaseHistory] = []
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    func append(_ history: Beverage) {
        list.append((history, Date()))
    }
    
    func handle(_ handler: (_ name: String, _ date: Date)->()) {
        list.forEach {
            handler($0.beverage.summary(isSelectable: false), $0.date)
        }
    }
}
