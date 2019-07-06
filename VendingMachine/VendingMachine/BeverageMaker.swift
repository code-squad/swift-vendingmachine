import Foundation

class BeverageMaker {
    
    struct ExampleDate {
        static let date1 = Date("20190208")!
        static let date2 = Date("20190411")!
        static let date3 = Date("20190505")!
        static let date4 = Date("20190625")!
    }
    
    enum MilkOption {
        case strawberry
        case chocolate
        
        var initial: (String, Date) -> Milk {
            switch self {
            case .strawberry:
                return StrawberryMilk.init
            case .chocolate:
                return ChocolateMilk.init
            }
        }
    }
    
    enum SoftDrinkOption {
        case cola
        case lemonLimeDrink
        
        var initial: (Date) -> SoftDrink {
            switch self {
            case .cola:
                return Cola.init
            case .lemonLimeDrink:
                return LemonlimeDrink.init
            }
        }
    }
    
    enum CoffeeOption {
        case topCoffee
        case cantataCoffee
        
        var initial: (Date) -> Coffee {
            switch self {
            case .topCoffee:
                return TOPCoffee.init
            case .cantataCoffee:
                return CantataCoffee.init
            }
        }
    }
    
    func makeMilk(option: MilkOption) -> Milk {
        
    }
    
}
