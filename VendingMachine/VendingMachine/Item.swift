import Foundation

struct Item {
    
    private(set) var price: Coin
    
    private(set) var beverages = [Beverage]()
    
    init(price: Coin) {
        self.price = price
    }
    
    init(price: Coin, beverage: Beverage) {
        self.price = price
        beverages = [beverage]
    }
    
    mutating func add(_ beverage: Beverage) {
        beverages.append(beverage)
    }
    
    var count: Int {
        return beverages.count
    }
    
    func removeFirst() -> Beverage {
        return beverages.removeFirst()
    }
}
