//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    static var inventory = [[Beverage]]()
    
    static func run(){
        inventory = VendingMachine.initInventory()
        _ = VendingMachine.inventoryInformation()
    }
    
    /*
     재고 생성 기준
     1. 유통기한 랜덤
     2. 제품 종류 및 제품당 개수 랜덤
     */
    static func initInventory() -> [[Beverage]] {
        var beverages = [[Beverage]]()
        let numberOfBeverageType = Int.random(in: 4...8)
        for _ in 1...numberOfBeverageType {
            let numberPerItem = Int.random(in: 1...9)
            let beverage = RandomBeverage.random(select: numberPerItem)
            beverages.append(beverage)
        }
        
        return beverages
    }
    
    static func inventoryInformation(){
        for beverageType in self.inventory {
            for beverage in beverageType {
                print(beverage.description)
            }
        }
    }
}

VendingMachine.run()
