//
//  Coffee.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    init(openDate: Date) {
        super.init(brand: "동서식품", size: 200, price: 1400, name: "스타벅스 더블샷 에스프레소 & 크림", openDate: openDate)
    }
}
