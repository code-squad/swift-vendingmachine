//
//  lowFatBananMilk.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class LightBananaMilk: Milk {
    private var bottleCapColor: String
    init(volume: Int, price: Int, manufacturingDate: String) {
        self.bottleCapColor = "BLUE"
        super.init("바나나", 1.5, "빙그레", volume, price, "저지방 바나나우유", manufacturingDate)
    }
    override var description: String {
        return "\(super.kind)우유(\(String(describing: type(of: self)))) - " + super.description
    }

    func hasBlueCap() -> Bool {
        return bottleCapColor == "BLUE"
    }
}
