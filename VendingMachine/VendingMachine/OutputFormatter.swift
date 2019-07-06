import Foundation

class OutputFormatter {
    
    func itemsWithPrice(inventory: [String: Beverages]) -> [String] {
        
        return inventory.map { (name, beverages) -> String in
            let priceStr: String
            if let price = beverages.price {
                priceStr = "\(price)"
            } else {
                priceStr = "알수 없음"
            }
            return "\(name) \(priceStr)"
        }
    }
    
}
