//
//  LactoseFreeMilk.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class LactoseFreeMilk: Milk {
    init() {
        super.init(hasLactose: false,
                   brand: "매일유업",
                   size: 190,
                   price: 1100,
                   name: "소화가 잘되는 우유",
                   openDate: Date(before: 2))
    }
}
