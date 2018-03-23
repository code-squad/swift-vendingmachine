//
//  Inventory.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Inventory {
    private (set) var beverages = [Beverage]()
    static let welchs = Welchs("톡쏘는정훈", 400, 1500, "웰치스", "20171105", 40, .grape)
    static let chocoFlavoredMilk = ChocoFlavoredMilk("달콤한정훈", 250, 1700, "맛좋은초코유유", "20180301", .second_Grade, 200, 1)
    static let top = Top("분위기있는정훈", 200, 1500, "TOP", "20171225", .grande, .basic)
    static let dutchCoffeeStory = DutchCoffeeStory("분위기있는정훈", 300, 3000, "더치커피스토리", "20171005", .short, .forGiftUse)
    static let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20180321", .second_Grade, 72, 0.7)
    static let beverages: [Beverage] = [chocoFlavoredMilk, top, dutchCoffeeStory, welchs, bananaFlavord]
}
extension Inventory: AdminModable {
    func drinkLists() -> [Beverage] {
        return Inventory.beverages
    }
    
    mutating func add(productIndex: Int) throws {
        let listOfDrink = drinkLists()
        guard listOfDrink.indices.contains(productIndex-1)  else {
            throw ControllerCore.stockError.invalidProductNumber
        }
        beverages.append(listOfDrink[productIndex-1])
    }
    
    mutating func subtract(productIndex: Int) throws -> Beverage {
        let listOfDrink = drinkLists()
        guard listOfDrink.indices.contains(productIndex - 1) else {
            throw ControllerCore.stockError.invalidProductNumber
        }
        let deleteDrink = listOfDrink[productIndex - 1]
        for drink in beverages.enumerated() {
            if drink.element === deleteDrink {
                beverages.remove(at: drink.offset)
                return drink.element
            }
        }
        throw ControllerCore.stockError.empty
    }
    
    func listOfInventory() -> [Beverage : Int] {
        var countDictionary = [Beverage : Int]()
        for beverage in beverages {
            let count = countDictionary[beverage] ?? 0
            countDictionary[beverage] = count + 1
        }
        return countDictionary
    }
    
    func checkListOfOverExpirationDate() -> [Beverage] {
        return beverages.filter { $0.isValidate() == false }
    }
}
