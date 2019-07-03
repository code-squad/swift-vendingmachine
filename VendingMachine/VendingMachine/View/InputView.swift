import Foundation

class InputView: TextView {
    
    func ask(_ target: String) -> String {
        show("\(target): ")
        return readLine() ?? ""
    }
    
    func askNumber(_ target: String) -> Int {
        while true {
            let input = ask(target)
            guard let number = Int(input) else {
                show("숫자가 아님, 다시 입력.")
                continue
            }
            return number
        }
    }
    
    func showOptions(_ options: [String]) {
        for (index, option) in options.enumerated() {
            show("\(index + 1). \(option)")
        }
    }
    
    func askForChoice<Option>(options: [Option], showingBy showForm: [String]) -> Option {
        
        showOptions(showForm)
        
        while true {
            let selection = askNumber("숫자")
            
            guard (1...options.count).contains(selection) else {
                show("제공되지 않는 선택지임.")
                continue
            }
            return options[selection - 1]
        }
    }
}
