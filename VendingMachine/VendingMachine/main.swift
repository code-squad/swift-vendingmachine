import Foundation

func main() {
    var controller = VendingMachineController()
    
    var beverages = [
        StrawberryMilk(milkFactoryIdentifier: "어느 목장1", dateOfManufacture: Date()),
        Cola(dateOfManufacture: Date()),
        LemonlimeDrink(dateOfManufacture: Date()),
        TOPCoffee(dateOfManufacture: Date()),
        CantataCoffee(dateOfManufacture: Date())
    ]
    
    controller.machine.addItems(beverages)
    
    while true {
        controller.selectFunction()
    }
}

main()
