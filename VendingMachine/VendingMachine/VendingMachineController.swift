import Foundation

class VendingMachineController {
    
    var inputView = InputView()
    var outputView = OutputView()
    
    var machine = VendingMachine()
    
    func insertCoins() {
        inputView.show("넣을 코인의 수량을 입력하세요.")
        let coins = inputView.askNumber("수량")
        machine.insertCoins(coins)
    }
    
    func vend() {
        
    }
}
