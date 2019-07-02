import Foundation

class InputController {
    
    var inputView = InputView()
    
    func askForChoice(options: [String], question: String) -> String {
        inputView.show(question)
        inputView.showOptions(options)
        while true {
            let input = inputView.ask("숫자")
            guard let selection = Int(input) else {
                continue
            }
            guard (1...options.count).contains(selection) else {
                continue
            }
            return options[selection - 1]
        }
    }
    
}
