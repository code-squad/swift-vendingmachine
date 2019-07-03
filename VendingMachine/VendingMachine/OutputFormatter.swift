import Foundation

class OutputFormatter {
    
    func itemsWithPrice(inventory: [String: Item]) -> [String] {
        var items = [String]()
        inventory.forEach { (name, item) in
            items.append("\(name) \(item.price)코인 (\(item.count)개)")
        }
        return items
    }
    
}
