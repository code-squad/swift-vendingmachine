//
//  VendingMachineMock.swift
//  VendingMachineTests
//
//  Created by TaeHyeonLee on 2017. 12. 18..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class VendingMachineMock: VendingMachineProtocol, CustomStringConvertible {
    private var coins: Int
    private var inventory: Inventory
    private var salesHistory: Products = []

    enum Mode {
        case admin
        case user
        case none
    }

    convenience init() {
        let dateOfManufacture: Date = "20171207".getDateFromString()
        let validate: Date = "20171220".getDateFromString()
        let strawberryMilk = StrawberryMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "딸기우유", dateOfManufacture: dateOfManufacture, validate: validate)
        let expiredValidate: Date = "20171209".getDateFromString()
        let bananaMilk = BananaMilk.init(brand: "서울우유", weight: 200, price: 1000, name: "날마다바나나우유", dateOfManufacture: dateOfManufacture, validate: expiredValidate)
        let pepciCoke = PepciCoke.init(brand: "펩시", weight: 350, price: 2000, name: "다이어트콜라", dateOfManufacture: dateOfManufacture, lowCalorie: true)
        let topCoffee = TOPCoffee.init(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", dateOfManufacture: dateOfManufacture, hot: true)
        let kantata = Kantata.init(brand: "Kantata", weight: 400, price: 3000, name: "칸타타", dateOfManufacture: dateOfManufacture, hot: true)
        let georgia = Georgia.init(brand: "코카콜라", weight: 400, price: 3000, name: "죠지아", dateOfManufacture: dateOfManufacture, hot: false)
        var inventoryMock: Inventory = [:]
        inventoryMock[String(strawberryMilk.description.split(separator: "(")[0])] = [strawberryMilk]
        inventoryMock[String(bananaMilk.description.split(separator: "(")[0])] = [bananaMilk]
        inventoryMock[String(pepciCoke.description.split(separator: "(")[0])] = [pepciCoke]
        inventoryMock[String(topCoffee.description.split(separator: "(")[0])] = [topCoffee]
        inventoryMock[String(kantata.description.split(separator: "(")[0])] = [kantata]
        inventoryMock[String(georgia.description.split(separator: "(")[0])] = [georgia]
        self.init(coins: 5000, inventory: inventoryMock)
    }

    private init(coins: Int, inventory: Inventory) {
        self.coins = coins
        self.inventory = inventory
    }

    var description: String {
        return "coins: \(String(coins))원, inventory: \(String(describing: inventory))"
    }

    func getMode(input: String) -> Mode {
        if input == "1" {
            return Mode.admin
        } else if input == "2" {
            return Mode.user
        } else {
            return Mode.none
        }
    }

    func getBalance() -> Int {
        return coins
    }

    func getInventory() -> Inventory {
        return inventory.filter { $0.value.count > 0 }
    }

    func getSalesHistory() -> Products {
        return salesHistory
    }

    func addInventory(category: Category, product: Beverage) {
        inventory[category] = [product]
    }

    func insertCoins(_ amount: Int) {
        coins += amount
    }

    func remove(category: Category, at i: Int) {
        inventory[category]?.remove(at: i)
    }

    func buy(category: Category) {
        salesHistory.append(inventory[category]!.removeFirst())
        coins -= salesHistory.last!.price
    }

}
