import Foundation

class InputView: TextView {
    
    func ask(_ target: String) -> String {
        show("\(target): ")
        return readLine() ?? ""
    }
}
