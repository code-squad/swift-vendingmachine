import Foundation

enum InputError: Error {
    case invalidSelection
}

class InputController {
    
    var inputView = InputView()
    var outputView = OutputView()
    
    var machine = VendingMachine()
    
    func askForChoice(options: [String], question: String) -> Result<String, InputError> {
        inputView.show(question)
        inputView.showOptions(options)
        
        let selection = askNumber("숫자")
        
        guard (1...options.count).contains(selection) else {
            return .failure(InputError.invalidSelection)
        }
        return .success(options[selection - 1])
    }
    
    func askNumber(_ target: String) -> Int {
        while true {
            let input = inputView.ask(target)
            guard let number = Int(input) else {
                inputView.show("숫자가 아님, 다시 입력.")
                continue
            }
            return number
        }
    }
    
    func insertCoins() {
        inputView.show("넣을 코인의 수량을 입력하세요.")
        let coins = askNumber("수량")
        machine.insertCoins(coins)
    }
    
}
