import Foundation

enum VendingMachineError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(coinsNeeded: Int)
}

typealias Coin = Int

class VendingMachine {
    
    private(set) var inventory = Inventory()
    private(set) var coinsDeposited: Coin = 0
    private(set) var purchasedItems = [Beverage]()
    
    func insertCoins(_ coins: Coin) {
        coinsDeposited += coins
    }
    
    func vend(itemNamed name: String) throws -> Beverage {
        
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price! <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price! - coinsDeposited)
        }
        
        coinsDeposited -= item.price!
        let itemVended = inventory[name]!.removeFirst()
        purchasedItems.append(itemVended)
        return itemVended
    }
    
    var availableItems: [String] {
        return inventory.filter { (_, item) in
            item.price! <= coinsDeposited
            }.keys.map { $0 }
    }
    
    var hotBeverages: [String] {
        return inventory.hotBeverages
    }
    
    var expiredBeverages: [Beverage] {
        return inventory.expiredBeverages
    }
    
    func addItem(_ beverage: Beverage) {
        inventory.addItem(beverage)
    }
    
    func addItems(_ beverages: [Beverage]) {
        inventory.addItems(beverages)
    }
}
