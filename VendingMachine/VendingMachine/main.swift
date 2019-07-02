import Foundation

let beverages = [
    StrawberryMilk(milkFactoryIdentifier: "어느목장1", dateOfManufacture: Date("20190626")!),
    Cola(dateOfManufacture: Date("20190615")!),
    LemonlimeDrink(dateOfManufacture: Date("20180205")!),
    TOPCoffee(dateOfManufacture: Date("20190121")!)
]

for beverage in beverages {
    print(beverage)
}


