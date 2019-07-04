import Foundation

func main() {
    var controller = VendingMachineController()
    var beverageMaker = BeverageMaker()
    
    controller.machine.addItems(beverageMaker.makeBeverages(count: 20))
    
    while true {
        controller.selectFunction()
    }
}

main()
