import Foundation

class VendingMachineController {
    
    struct Message {
        static let insertCoins = "코인 추가"
        static let vendItem = "음료 구매"
        static let enterCoinsToDeposit = "넣을 코인의 수량을 입력하세요."
        static let amount = "수량"
        static let followingBeveragesAvaliable = "다음과 같은 음료가 있습니다."
        
        static let modes = [
            false: "사용자 모드",
            true: "관리자 모드"
        ]
        
        static func modeChanged(isAdministrator administrator: Bool) -> String {
            return "\(Message.modes[administrator]!)로 변경했습니다."
        }
        
        static func askToChangeMode(currentMode: Bool) -> String {
            return "\(Message.modes[!currentMode]!)로 변경하시겠습니까? 현재 모드: \(Message.modes[currentMode]!)"
        }
        static let enterY = "동의하면 Y 입력"
    }
    
    var inputView = InputView()
    var outputView = OutputView()
    
    var formatter = OutputFormatter()
    
    var machine = VendingMachine()
    
    func askToSwitchMode() {
        inputView.show(Message.askToChangeMode(currentMode: machine.administratorMode))
        guard inputView.ask(Message.enterY) == "Y" else {
            return
        }
        let mode = machine.toggleAdministratorMode()
        outputView.show(Message.modeChanged(isAdministrator: mode))
    }
    
    func selectFunction() {
        outputView.showCoinsDeposited(machine.coinsDeposited)
        outputView.showInventory(machine.inventory)
        
        let functions = [
            Message.insertCoins: insertCoins,
            Message.vendItem: vend
        ]
        
        let selectedFuntion = inputView.askForChoice(options: functions.values.map { $0 }, showingBy: functions.keys.map { $0 })
        outputView.nextLine()
        selectedFuntion()
        outputView.nextLine()
    }
    
    func insertCoins() {
        inputView.show(Message.enterCoinsToDeposit)
        let coins = inputView.askNumber(Message.amount)
        machine.insertCoins(coins)
    }
    
    func vend() {
        outputView.showCoinsDeposited(machine.coinsDeposited)
        inputView.show(Message.followingBeveragesAvaliable)
        
        let options = machine.inventory.keys.map { $0 }
        let showForm = formatter.itemsWithPrice(inventory: machine.inventory)
        
        let itemName = inputView.askForChoice(options: options, showingBy: showForm)
        
        do {
            let itemVended = try machine.vend(itemNamed: itemName)
            outputView.showVendingResult(itemVended: itemVended)
        } catch {
            outputView.showError(error)
        }
        
        
    }
}
