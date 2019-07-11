import Foundation

func main() {
    var controller = VendingMachineController()
    
    
    controller.askToSwitchMode()
    
    while true {
        controller.selectFunction()
    }
}

main()
