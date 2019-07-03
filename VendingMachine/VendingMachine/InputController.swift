import Foundation

enum InputError: Error {
    case invalidSelection
}

class InputController {
    
    var inputView = InputView()
    var outputView = OutputView()
    
    var machine = VendingMachine()
    
    func askForChoice<Option>(options: [Option], showingBy showForm: (Option) -> String) -> Result<Option, InputError> {
        
        let outputOptions = options.map { showForm($0) }
        
        inputView.showOptions(outputOptions)
        
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
    
    func vend() {
        
    }
    
    func itemsWithPrice(inventory: [String: Item]) -> [String] {
        var items = [String]()
        inventory.forEach { (name, item) in
            items.append("\(name) \(item.price)코인 (\(item.count)개)")
        }
        return items
    }
    
}
