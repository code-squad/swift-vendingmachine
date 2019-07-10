import Foundation

class OutputView: TextView {
    
    struct Message {
        static func vended(_ itemName: String) -> String {
            return "\(itemName)을(를) 구매했습니다."
        }
        
        static func removed(_ itemName: String) -> String {
            return "\(itemName)을(를) 제거했습니다."
        }
        
        static func reduceCoins(_ coins: Coin) -> String {
            return "\(coins)코인을 차감합니다."
        }
        
        static func coinsDeposited(_ coins: Coin) -> String {
            return "현재 \(coins)코인이 넣어져 있습니다."
        }
        
        static func nameWithCount(name: String, count: Int) -> String {
            return "\(name)(\(count)개)"
        }
        
        static func error(_ error: Error) -> String {
            return "오류: \(error)"
        }
    }
    
    func showVendingResult(itemVended: Beverage) {
        show("\(Message.vended(itemVended.name)) \(Message.reduceCoins(itemVended.price))")
    }
    
    func showRemovingResult(removedItem: Beverage) {
        show(Message.removed(removedItem.name))
    }
    
    func showCoinsDeposited(_ coins: Coin) {
        show(Message.coinsDeposited(coins))
    }
    
    func showInventory(_ inventory: [String: Beverages]) {
        var inventoryInfo = [String]()
        inventory.forEach { (name, beverages) in
            inventoryInfo.append(Message.nameWithCount(name: name, count: beverages.count))
        }
        show(inventoryInfo.joined(separator: " "))
    }
    
    func showError(_ error: Error) {
        show(Message.error(error))
    }
    
}
