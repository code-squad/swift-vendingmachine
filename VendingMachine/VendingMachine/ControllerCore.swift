//
//  ControllerCore.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class ControllerCore {
    private var inventory: Inventory
    static let welchs = Welchs("톡쏘는정훈", 400, 1500, "웰치스", "20171105", 40, .grape)
    static let chocoFlavoredMilk = ChocoFlavoredMilk("달콤한정훈", 250, 1700, "맛좋은초코유유", "20180301", .second_Grade, 200, 1)
    static let top = Top("분위기있는정훈", 200, 1500, "TOP", "20171225", .grande, .basic)
    static let dutchCoffeeStory = DutchCoffeeStory("분위기있는정훈", 300, 3000, "더치커피스토리", "20171005", .short, .forGiftUse)
    static let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20180321", .second_Grade, 72, 0.7)
    static let beverages: [Beverage] = [chocoFlavoredMilk, top, dutchCoffeeStory, welchs, bananaFlavord]
    init() {
        self.inventory = Inventory()
    }

}


extension ControllerCore: AdminModable {
    func add(productIndex: Int) throws {
        try inventory.add(productIndex: productIndex)
    }
    
    func subtract(productIndex: Int) throws -> Beverage {
        return try inventory.subtract(productIndex: productIndex)
        
    }
    
    func checkIncome() -> Int {
        return inventory.checkIncome()
    }
    
    func listOfInventory() -> [Beverage : Int] {
        var countDictionary = [Beverage : Int]()
        for beverage in inventory.beverageLists {
            let count = countDictionary[beverage] ?? 0
            countDictionary[beverage] = count + 1
        }
        return countDictionary
    }
    
    func checkListOfOverExpirationDate() -> [Beverage] {
        return inventory.beverageLists.filter { $0.isValidate() == false }
    }
    
    func drinkLists() -> [Beverage] {
        return inventory.drinkLists()
    }
    
}

extension ControllerCore: UserModable {
    func buy(productIndex: Int) throws -> Beverage {
        
       return try self.inventory.buy(productIndex: productIndex)
    }
    
    func insertMoney(userMoney: Int) {
        inventory.insertMoney(userMoney: userMoney)
    }
    
    func buyableBeverages() -> [Beverage] {
        let listOfCanBuy = inventory.beverageLists.filter { $0.isValidate() && $0.price <= inventory.userBalance() }
        return listOfCanBuy
    }
    
    func userBalance() -> Int {
        return inventory.userBalance()
    }
    
    func shoppingHistory() -> [Beverage] {
        return self.inventory.shoppingHistory()
    }
    
    func withdrawlBalance() -> Int {
        return inventory.withdrawlBalance()
    }
}

extension ControllerCore {
    enum stockError: String, Error {
        case soldOut = "해당 음료수는 품절되었습니다."
        case invalidProductNumber = "유효하지 않은 음료수 번호 입니다."
        case empty = "재고가 하나도 없습니다."
    }
    
}

