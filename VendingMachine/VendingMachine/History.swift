//
//  History.swift
//  VendingMachine
//
//  Created by 윤지영 on 18/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class History {
    private var purchases: [Beverage]

    init() {
        self.purchases = []
    }

    func update(purchase beverage: Beverage) {
        purchases.append(beverage)
    }

}
