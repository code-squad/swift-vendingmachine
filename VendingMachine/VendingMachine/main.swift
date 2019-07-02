import Foundation

func main() {
    
    var controller = InputController()
    var outputView = OutputView()
    var machine = VendingMachine()
    
    outputView.showCoinsDeposited(machine.coinsDeposited)
    outputView.show("다음과 같은 음료가 있습니다.")
    outputView.showInventory(machine.inventory)
    
}
