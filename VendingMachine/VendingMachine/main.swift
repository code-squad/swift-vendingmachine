import Foundation

func main() {
    var controller = VendingMachineController()
    var beverageMaker = BeverageMaker()
    
    controller.machine.toggleAdministratorMode()
    try! controller.machine.addItems(beverageMaker.exampleBeverages)
    controller.machine.toggleAdministratorMode()
    
    
    while true {
        controller.selectFunction()
    }
}

main()
