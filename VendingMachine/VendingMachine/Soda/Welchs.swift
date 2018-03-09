//
//  Welchs.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class Welchs: Soda {
    private var kindOfWelchs: KindOfWelchs = .grape
    init(_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufactured_date: String, _ amountOfSugar: Float, _ kindOfWelchs: KindOfWelchs) {
        self.kindOfWelchs = kindOfWelchs
        super.init(brand, weight, price, name, manufactured_date, amountOfSugar)
    }
 
}

enum KindOfWelchs {
    case grape, whiteGrape, strawberry
}
