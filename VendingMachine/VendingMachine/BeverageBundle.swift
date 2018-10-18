//
//  BeverageBundle.swift
//  VendingMachine
//
//  Created by 이동건 on 18/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class BeverageBundle {
    private var beverages: [Beverage]
    
    func getBundleTag(_ handler: (Beverage, Int)->(String)) -> String {
        let first = beverages.first!
        return handler(first, beverages.count)
    }
    
    init(_ beverages: [Beverage]) {
        self.beverages = beverages
    }
}
