import Foundation

func main() {
    var controller = VendingMachineController()
    var beverageMaker = BeverageMaker()
    
    controller.machine.addItems(beverageMaker.exampleBeverages)
    
    while true {
        controller.selectFunction()
    }
}

main()
