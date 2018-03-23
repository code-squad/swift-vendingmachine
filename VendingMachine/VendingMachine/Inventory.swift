//
//  Inventory.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Inventory {
    private var beverageLists = [Beverage]()
    private var shoppingLists: ShoppingLists
    private var money = Money()
    private var userMoney: Int = 0
    private var income: Int = 0
    
    static let welchs = Welchs("톡쏘는정훈", 400, 1500, "웰치스", "20171105", 40, .grape)
    static let chocoFlavoredMilk = ChocoFlavoredMilk("달콤한정훈", 250, 1700, "맛좋은초코유유", "20180301", .second_Grade, 200, 1)
    static let top = Top("분위기있는정훈", 200, 1500, "TOP", "20171225", .grande, .basic)
    static let dutchCoffeeStory = DutchCoffeeStory("분위기있는정훈", 300, 3000, "더치커피스토리", "20171005", .short, .forGiftUse)
    static let bananaFlavord = BananaFlavoredMilk("신선한정훈", 250, 1500, "맛좋은바나나우유", "20180321", .second_Grade, 72, 0.7)
    static let beverages: [Beverage] = [chocoFlavoredMilk, top, dutchCoffeeStory, welchs, bananaFlavord]
    init() {
        self.shoppingLists = ShoppingLists()
    }
}
extension Inventory: AdminModable, AdminIncome {
    func gainIncome(beveragePrice: Int) {
        
    }
    
    func drinkLists() -> [Beverage] {
        return Inventory.beverages
    }
    
    func checkIncome() -> Int {
        return self.money.checkIncome()
    }
    
    func add(productIndex: Int) throws {
        let listOfDrink = drinkLists()
        guard listOfDrink.indices.contains(productIndex-1)  else {
            throw stockError.invalidProductNumber
        }
        beverageLists.append(listOfDrink[productIndex-1])
    }
    
    func subtract(productIndex: Int) throws -> Beverage {
        let listOfDrink = drinkLists()
        guard listOfDrink.indices.contains(productIndex - 1) else {
            throw stockError.invalidProductNumber
        }
        let deleteDrink = listOfDrink[productIndex - 1]
        for drink in beverageLists.enumerated() {
            if drink.element === deleteDrink {
                beverageLists.remove(at: drink.offset)
                return drink.element
            }
        }
        throw stockError.empty
    }
    
    func listOfInventory() -> [Beverage : Int] {
        var countDictionary = [Beverage : Int]()
        for beverage in beverageLists {
            let count = countDictionary[beverage] ?? 0
            countDictionary[beverage] = count + 1
        }
        return countDictionary
    }
    
    func checkListOfOverExpirationDate() -> [Beverage] {
        return beverageLists.filter { $0.isValidate() == false }
    }
    
    
}
extension Inventory: UserModable, UserMoney {
    func insertMoney(userMoney: Int) {
        self.money.insertMoney(userMoney: userMoney)
    }
    
    func userBalance() -> Int {
        return self.money.userBalance()
    }
    
    func withdrawlBalance() -> Int {
        return self.money.withdrawlBalance()
    }
    
    func shoppingHistory() -> [Beverage] {
        return self.shoppingLists.shoppingHistory()
    }
    
    func buyableBeverages() -> [Beverage] {
        let listOfCanBuy = beverageLists.filter { $0.isValidate() &&
            $0.price <= userMoney
        }
        return listOfCanBuy
    }
    
    func buy(productIndex: Int) throws -> Beverage {
        let drinks = buyableBeverages()
        guard drinks.indices.contains(productIndex - 1) else {
            throw stockError.invalidProductNumber
        }
        let purchasedBeverage = drinks[productIndex - 1]
        for beverage in beverageLists.enumerated() {
            if beverage.element == purchasedBeverage {
                self.userMoney -= purchasedBeverage.price
                money.vendingMachineIncome += purchasedBeverage.price
                self.income += purchasedBeverage.price
                self.beverageLists.remove(at: beverage.offset)
                self.shoppingLists.buy(purchasedBeverage)
                return purchasedBeverage
            }
        }
        throw stockError.soldOut
    }
}

extension Inventory {
    enum stockError: CustomStringConvertible, Error {
        case soldOut
        case invalidProductNumber
        case empty
        var description: String {
            switch self {
            case .soldOut: return "해당 음료수는 품절되었습니다."
            case .invalidProductNumber : return "유효하지 않은 음료수 번호 입니다."
            case .empty : return "재고가 하나도 없습니다."
            }
        }
    }
    
}
