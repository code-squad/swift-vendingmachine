import Foundation

class InputView: TextView {
    
    func ask(_ target: String) -> String {
        show("\(target): ")
        return readLine() ?? ""
    }
    
    func showOptions(_ options: [String]) {
        for (index, option) in options.enumerated() {
            show("\(index + 1). \(option)")
        }
    }
}
