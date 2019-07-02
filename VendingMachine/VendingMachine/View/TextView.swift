import Foundation

class TextView {
    
    func show(_ text: String, terminator: String = "\n") {
        print(text, terminator: terminator)
    }
    
    func nextLine() {
        print()
    }
}
