import Foundation

enum VendingMachineError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(coinsNeeded: Int)
}

typealias Coin = Int

class VendingMachine {
    
    private(set) var inventory = [String: Item]()
    private(set) var coinsDeposited: Coin = 0
    private(set) var purchasedItems = [Beverage]()
    
    var availableItems: [String] {
        var items = [String]()
        
        inventory.forEach { (name: String, item: Item) in
            if item.price <= coinsDeposited {
                items.append(name)
            }
        }
        return items
    }
    
    var expiredBeverages: [Beverage] {
        var expired = [Beverage]()
        inventory.forEach { (_, beverages: [Beverage]) in
            beverages.forEach { (beverage) in
                if beverage.isExpired(targetDate: Date()) {
                    expired.append(beverage)
                }
            }
        }
        return expired
    }
    
    
    func insertCoins(_ coins: Coin) {
        coinsDeposited += coins
    }
    
    func addItem(_ item: Beverage) {
        if inventory[item.name] == nil {
            inventory[item.name] = [item]
        } else {
            inventory[item.name]!.append(item)
        }
    }
    
    func addItems(_ items: [Beverage]) {
        items.forEach { addItem($0) }
    }
    
    func vend(itemNamed name: String) throws -> Beverage {
        
        guard let beverages = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard beverages.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard beverages[0].price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: beverages[0].price - coinsDeposited)
        }
        
        coinsDeposited -= beverages[0].price
        let item = inventory[name]!.removeFirst()
        purchasedItems.append(item)
        return item
    }
    
    var hotBeverages: [String] {
        var hotBeverages = [String]()
        inventory.forEach { (name: String, beverages: [Beverage]) in
            guard let beverage = beverages.first else {
                return
            }
            if beverage.isHot {
                hotBeverages.append(name)
            }
        }
        return hotBeverages
    }
    
}
