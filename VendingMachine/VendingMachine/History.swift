//
//  History.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class History {
    private var beverages = [Beverage]()

    public func add(with beverage: Beverage) {
        self.beverages.append(beverage)
    }

    public func list() -> [Beverage] {
        return self.beverages
    }
}
