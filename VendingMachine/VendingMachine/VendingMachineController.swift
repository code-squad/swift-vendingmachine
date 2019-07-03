import Foundation

class VendingMachineController {
    
    var inputView = InputView()
    var outputView = OutputView()
    
    var formatter = OutputFormatter()
    
    var machine = VendingMachine()
    
    func insertCoins() {
        inputView.show("넣을 코인의 수량을 입력하세요.")
        let coins = inputView.askNumber("수량")
        machine.insertCoins(coins)
    }
    
    func vend() {
        outputView.showCoinsDeposited(machine.coinsDeposited)
        inputView.show("다음과 같은 음료가 있습니다.")
        
        let options = machine.inventory.keys.map { $0 }
        let showForm = formatter.itemsWithPrice(inventory: machine.inventory)
        
        let itemName = inputView.askForChoice(options: options, showingBy: showForm)
        
        do {
            let itemVended = try machine.vend(itemNamed: itemName)
            outputView.showVendingResult(itemVended: itemVended)
        } catch {
            outputView.showError(error)
        }
        
        
    }
}
