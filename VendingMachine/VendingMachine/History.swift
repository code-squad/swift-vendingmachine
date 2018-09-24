//
//  History.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class History {
    static let shared = History() // for Singleton
    private var beverages = [Beverage]()
    
    public func add(with beverage : Beverage) {
        self.beverages.append(beverage)
    }
    
    public func list()  {
        print("\(self.beverages.map({ $0.description }))")
    }
}
