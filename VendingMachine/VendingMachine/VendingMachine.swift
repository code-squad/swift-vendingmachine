import Foundation

enum VendingMachineError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(coinsNeeded: Int)
}

typealias Coin = Int
typealias Inventory = [String: Item]

class VendingMachine {
    
    private(set) var inventory = Inventory()
    private(set) var coinsDeposited: Coin = 0
    private(set) var purchasedItems = [Beverage]()
    
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
}

/// inventory 관련 동작
extension VendingMachine {
    
    var availableItems: [String] {
        return inventory.filter { (_, item) in
            item.price <= coinsDeposited
            }.keys.map { $0 }
    }
    
    var hotBeverages: [String] {
        return inventory.hotBeverages
    }
    
    var expiredBeverages: [Beverage] {
        return inventory.expiredBeverages
    }
}

extension Inventory {
    var hotBeverages: [String] {
        return self.filter { (_, item) in
            item.isHot
            }.keys.map { $0 }
    }
    
    var expiredBeverages: [Beverage] {
        let allBeverages = self.values.flatMap { $0.beverages }
        return allBeverages.filter { $0.isExpired(targetDate: Date()) }
    }
}
