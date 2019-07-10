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
        
        static let enterItemNameToRemove = "지울 제품 이름 입력"
        static let itemName = "음료 이름"
        
        static let manualCreate = "수동으로 생성하기"
        static let selectInOptions = "옵션에서 선택하기"
        
        static let selectCreateOption = "음료 생성 방법을 선택하세요."
        
        static func enter(target: String) -> String {
            return "\(target)을(를) 입력하세요."
        }
        
        static func choose(target: String) -> String {
            return "\(target)을(를) 선택하세요."
        }
    }
    
    var inputView = InputView()
    var outputView = OutputView()
    
    var formatter = OutputFormatter()
    
    var machine = VendingMachine()
    var maker = BeverageMaker()
    
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
        
        let selectedFuntion = inputView.askForChoice(options: functions.map { $0.value }, showingBy: functions.map { $0.key })
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
        
        let options = machine.inventory.map { $0.key }
        let showForm = formatter.itemsWithPrice(inventory: machine.inventory)
        
        let itemName = inputView.askForChoice(options: options, showingBy: showForm)
        let itemVended: Beverage
        do {
            itemVended = try machine.vend(itemNamed: itemName)
        } catch {
            outputView.showError(error)
            return
        }
        outputView.showVendingResult(itemVended: itemVended)
    }
    
    func removeItem() {
        inputView.show(Message.enterItemNameToRemove)
        let name = inputView.ask(Message.itemName)
        let removedItem: Beverage
        do {
            removedItem = try machine.remove(itemNamed: name)
        } catch {
            outputView.showError(error)
            return
        }
        outputView.showRemovingResult(removedItem: removedItem)
    }
    
    func addItem() {
        
    }
    
    func makeBeverage() -> Beverage {
        
        let functions = [
            Message.manualCreate: makeBeverageManual,
            Message.selectInOptions: makeBeverageInOptions
        ]
        
        inputView.show(Message.selectCreateOption)
        let makeBeverage = inputView.askForChoice(options: functions.map { $0.value }, showingBy: functions.map { $0.key })
        
        return makeBeverage()
    }
    
    
    func makeBeverageManual() -> Beverage {
        inputView.show(Message.enter(target: "이름"))
        let name = inputView.ask("이름")
        
        inputView.show(Message.enter(target: "가격"))
        let price = inputView.askNumber("가격")
        
        inputView.show(Message.enter(target: "용량"))
        let packageSize = inputView.askNumber("용량")
        
        inputView.show(Message.enter(target: "브랜드"))
        let brand = inputView.ask("브랜드")
        
        inputView.show(Message.enter(target: "유효기간 일 수"))
        let expirationPeriod = inputView.askDays("유효기간")
        
        inputView.show(Message.enter(target: "음료의 온도"))
        let beverageTemperature = inputView.askNumber("온도")
        
        inputView.show(Message.enter(target: "생산 날짜"))
        inputView.show("(입력 형태: yyyyMMdd)")
        let dateOfManufacture = inputView.askDate("생산 날짜")
        
        return Beverage(brand: brand, packageSize: packageSize, price: price, name: name, dateOfManufacture: dateOfManufacture, expirationPeriod: expirationPeriod, beverageTemperature: beverageTemperature)
    }
    
    func makeBeverageInOptions() -> Beverage {
        let beverageOptions = [
            "우유": makeMilk,
            "탄산 음료": makeSoftDrink,
            "커피": makeCoffee
        ]
        
        let make = inputView.askForChoice(options: beverageOptions.map { $0.value }, showingBy: beverageOptions.map { $0.key })
        inputView.show(Message.enter(target: "생산 날짜"))
        let dateOfManufacture = inputView.askDate("생산 날짜")
        return make(dateOfManufacture)
    }
    
    func makeMilk(dateOfManufacture: Date) -> Milk {
        inputView.show(Message.choose(target: "우유의 종류"))
        let option = inputView.askForChoice(options: [BeverageMaker.MilkOption.chocolate, .strawberry], showingBy: ["초코 우유", "딸기 우유"])
        
        inputView.show(Message.enter(target: "우유 목장"))
        let milkFactory = inputView.ask("목장")
        return maker.makeMilk(option: option, dateOfManufacture: dateOfManufacture, milkFactory: milkFactory)
    }
    
    func makeSoftDrink(dateOfManufacture: Date) -> SoftDrink {
        inputView.show(Message.choose(target: "탄산 음료의 종류"))
        let option = inputView.askForChoice(options: [BeverageMaker.SoftDrinkOption.cola, .lemonLimeDrink], showingBy: ["콜라", "사이다"])
        return maker.makeSoftDrink(option: option, dateOfManufacture: dateOfManufacture)
    }
    
    func makeCoffee(dateOfManufacture: Date) -> Coffee {
        inputView.show(Message.choose(target: "커피의 종류"))
        let option = inputView.askForChoice(options: [BeverageMaker.CoffeeOption.cantataCoffee, .topCoffee], showingBy: ["칸타타", "TOP"])
        return maker.makeCoffee(option: option, dateOfManufacture: dateOfManufacture)
    }
}
