import Foundation

class OutputView: TextView {
    
    func showVendingResult(itemVended: Beverage) {
        show("\(itemVended.name)을(를) 구매했습니다. \(itemVended.price)코인을 차감합니다.")
    }
    
    func showCoinsDeposited(_ coins: Coin) {
        show("현재 \(coins)코인이 넣어져 있습니다.")
    }
    
    func showInventory(_ inventory: [String: Item]) {
        var inventoryInfo = [String]()
        inventory.forEach { (name, item) in
            inventoryInfo.append("\(name)(\(item.count)개)")
        }
        show(inventoryInfo.joined(separator: " "))
    }
    
    func showError(_ error: Error) {
        show("\(error)")
    }
    
}
