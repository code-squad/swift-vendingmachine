import Foundation

enum InputError: Error {
    case notNumber
    case invalidSelection
}

class InputController {
    
    var inputView = InputView()
    
    func askForChoice(options: [String], question: String) -> Result<String, InputError> {
        inputView.show(question)
        inputView.showOptions(options)
        
        let input = inputView.ask("숫자")
        guard let selection = Int(input) else {
            return .failure(InputError.notNumber)
        }
        
        guard (1...options.count).contains(selection) else {
            return .failure(InputError.invalidSelection)
        }
        return .success(options[selection - 1])
    }
    
}
