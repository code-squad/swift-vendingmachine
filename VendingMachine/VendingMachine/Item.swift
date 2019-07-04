import Foundation

struct Item {
    
    private(set) var price: Coin
    
    private(set) var beverages = [Beverage]()
    
    private var beverageTemperature: Int
    
    init(price: Coin, beverageTemperature: Int) {
        self.price = price
        self.beverageTemperature = beverageTemperature
    }
    
    init(price: Coin, beverage: Beverage) {
        self.price = price
        beverages = [beverage]
        beverageTemperature = beverage.beverageTemperature
    }
    
    mutating func add(_ beverage: Beverage) {
        beverages.append(beverage)
    }
    
    var count: Int {
        return beverages.count
    }
    
    mutating func removeFirst() -> Beverage {
        return beverages.removeFirst()
    }
    
    var isHot: Bool {
        return beverageTemperature > 50
    }
}
