//
//  MandarineMilk.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class MandarineMilk: Milk {
    init() {
        super.init(brand: "빙그레", size: 240, price: 1200, name: "귤맛 우유", openDate: Date(before: 3))
    }
}
