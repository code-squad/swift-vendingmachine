//
//  DutchCoffeeStory.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class DutchCoffeeStory: Coffee, Printable {
    private let purpose: DutchCoffeeStoryPurpose
    init(_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufactured_date: String,_ sizeType: CoffeeSize,  _ purpose: DutchCoffeeStoryPurpose) {
        self.purpose = purpose
        super.init(brand, weight, price, name, manufactured_date, sizeType)
    }
    var description: String {
        return CoffeeTastes.dutchCoffeeStory.description + DutchCoffeeStory.className + self.beverageDescription()
    }
    
    func printBeverage() {
        print(self.description)
    }
}

enum DutchCoffeeStoryPurpose {
    case forFamilyUse, forGiftUse
}
