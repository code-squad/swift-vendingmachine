import Foundation

class BeverageMaker {
    
    private var randomDate: Date {
        return [
            Date("20190208")!,
            Date("20190411")!,
            Date("20190505")!,
            Date("20190625")!,
            ].randomElement()!
    }
    
    func makeMilk() -> Milk {
        if Bool.random() {
            return StrawberryMilk(milkFactoryIdentifier: "목장1", dateOfManufacture: randomDate)
        } else {
            return ChocolateMilk(milkFactoryIdentifier: "목장2", dateOfManufacture: randomDate)
        }
    }
    
    func makeSoftDrink() -> SoftDrink {
        if Bool.random() {
            return Cola(dateOfManufacture: randomDate)
        } else {
            return LemonlimeDrink(dateOfManufacture: randomDate)
        }
    }
    
    func makeCoffee() -> Coffee {
        if Bool.random() {
            return TOPCoffee(dateOfManufacture: randomDate)
        } else {
            return CantataCoffee(dateOfManufacture: randomDate)
        }
    }
    
    
    func makeBeverage() -> Beverage {
        let makers = [
            makeMilk,
            makeSoftDrink,
            makeCoffee
        ]
        return makers.randomElement()!()
    }
    
    func makeBeverages(count: Int) -> [Beverage] {
        var beverages = [Beverage]()
        for _ in 1...count {
            beverages.append(makeBeverage())
        }
        return beverages
    }
}
