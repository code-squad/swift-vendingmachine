//
//  TOPTheBlack.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class TOPTheBlack: Coffee {
    override var description: String {
        return "TOPTheBlack - \(super.description)"
    }
    init(openDate: Date) {
        super.init(hasMilk: false,
                   isHot: false,
                   brand: "맥심",
                   size: 275,
                   price: 1800,
                   name: "맥심 티오피 더 블랙",
                   openDate: openDate)
    }
}
