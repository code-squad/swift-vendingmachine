import Foundation

class InputView: TextView {
    
    struct Message {
        static let notNumber = "숫자가 아님."
        static let number = "숫자"
        static let invalidSelection = "유효하지 않은 선택."
        static let enterAgain = "다시 입력."
        static let invalidDate = "유효하지 않은 날짜"
    }
    
    func ask(_ target: String) -> String {
        show("\(target): ", terminator: "")
        return readLine() ?? ""
    }
    
    func askNumber(_ target: String) -> Int {
        while true {
            let input = ask(target)
            guard let number = Int(input) else {
                show("\(Message.notNumber) \(Message.enterAgain)")
                continue
            }
            return number
        }
    }
    
    func askDate(_ target: String) -> Date {
        while true {
            let input = ask(target)
            guard let date = Date(input) else {
                show(Message.invalidDate)
                continue
            }
            return date
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
            let selection = askNumber(Message.number)
            
            guard (1...options.count).contains(selection) else {
                show("\(Message.invalidSelection) \(Message.enterAgain)")
                continue
            }
            return options[selection - 1]
        }
    }
}
