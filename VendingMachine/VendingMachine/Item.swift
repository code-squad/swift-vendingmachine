import Foundation

struct Item {
    
    private(set) var price: Coin
    
    private var beverages = [Beverage]()
    
    init(price: Coin) {
        self.price = price
    }
    
    mutating func add(_ beverage: Beverage) {
        beverages.append(beverage)
    }
    
    
}
