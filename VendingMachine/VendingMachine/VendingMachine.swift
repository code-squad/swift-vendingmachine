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
        inventory.forEach { (_, item: Item) in
            item.beverages.forEach { (beverage) in
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
    
    func addItem(_ beverage: Beverage) {
        if inventory[beverage.name] == nil {
            inventory[beverage.name] = Item(price: beverage.price, beverage: beverage)
        } else {
            inventory[beverage.name]!.add(beverage)
        }
    }
    
    func addItems(_ items: [Beverage]) {
        items.forEach { addItem($0) }
    }
    
    func vend(itemNamed name: String) throws -> Beverage {
        
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        let itemVended = inventory[name]!.removeFirst()
        purchasedItems.append(itemVended)
        return itemVended
    }
    
    var hotBeverages: [String] {
        var hotBeverages = Set<String>()
        inventory.forEach { (name: String, item: Item) in
            item.beverages.forEach { (beverage: Beverage) in
                if beverage.isHot {
                    hotBeverages.insert(beverage.name)
                }
            }
        }
        return hotBeverages.map { $0 }
    }
    
}
