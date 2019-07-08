//
//  Sprite.swift
//  VendingMachine
//
//  Created by jang gukjin on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Sprite: Soda {
    static let lemonContent: Double = 5.0
    
    init(){
        super.init(capacity: 250, price: 1200, name: "스프라이트", stringDate: "20200826", calorie: 90)
    }
}
