import Foundation

class VendingMachineController {
    
    struct Message {
        
        struct Option {
            static let insertCoins = "코인 추가"
            static let vendItem = "음료 구매"
            
            static let addItem = "음료 추가"
            static let removeItem = "음료 제거"
            
            static let modes: [VendingMachine.Mode: String] = [
                .user: "사용자 모드",
                .administrator: "관리자 모드"
            ]
            static let manualCreate = "수동으로 생성하기"
            static let selectInOptions = "옵션에서 선택하기"
            
        }
        
        struct Question {
            static let enterCoinsToDeposit = "넣을 코인의 수량을 입력하세요."
            static let amount = "수량"
            static let askChangeToAdministrator = "관리자 모드로 변경하시겠습니까?"
            static let enterY = "동의하면 y 입력"
            
            static let enterItemNameToRemove = "지울 제품 이름 입력"
            static let itemName = "음료 이름"
            static let selectCreateOption = "음료 생성 방법을 선택하세요."
            
            static func enter(target: String) -> String {
                return "\(target)을(를) 입력하세요."
            }
            static func choose(target: String) -> String {
                return "\(target)을(를) 선택하세요."
            }
        }
        
        struct Description {
            static let followingBeveragesAvaliable = "다음과 같은 음료가 있습니다."
            
            static func modeChanged(to mode: VendingMachine.Mode) -> String {
                return "\(Message.Option.modes[mode]!)로 변경했습니다."
            }
            
            static func currentMode(_ mode: VendingMachine.Mode) -> String {
                return "현재 모드: \(Message.Option.modes[mode]!)"
            }
        }
        
        
        
        
        
        
        
        
        
        
        
    }
    
    private var inputView = InputView()
    private var outputView = OutputView()
    
    private var formatter = OutputFormatter()
    
    private var machine = VendingMachine()
    private var maker = BeverageMaker()
    
    func askToSwitchMode() {
        
        inputView.show(Message.Description.currentMode(machine.mode))
        inputView.show(Message.Question.askChangeToAdministrator)
        guard inputView.ask(Message.Question.enterY) == "y" else {
            return
        }
        machine.switchMode(to: .administrator)
        outputView.show(Message.Description.currentMode(machine.mode))
    }
    
    func selectFunction() {
        if machine.isAdministrator {
            selectFunctionAdministratorMode()
        } else {
            selectFunctionUserMode()
        }
    }
    
    func selectFunctionUserMode() {
        outputView.showCoinsDeposited(machine.coinsDeposited)
        outputView.showInventory(machine.inventory)
        
        let functions = [
            Message.Option.insertCoins: insertCoins,
            Message.Option.vendItem: vend
        ]
        
        let selectedFuntion = inputView.askForChoice(options: functions.map { $0.value }, showingBy: functions.map { $0.key })
        outputView.nextLine()
        selectedFuntion()
        outputView.nextLine()
    }
    
    func selectFunctionAdministratorMode() {
        outputView.showInventory(machine.inventory)
        
        let functions = [
            Message.Option.addItem: addItem,
            Message.Option.removeItem: removeItem
        ]
        
        let function = inputView.askForChoice(options: functions.map { $0.value }, showingBy: functions.map { $0.key })
        outputView.nextLine()
        function()
        outputView.nextLine()
    }
    
    func insertCoins() {
        inputView.show(Message.Question.enterCoinsToDeposit)
        let coins = inputView.askNumber(Message.Question.amount)
        machine.insertCoins(coins)
    }
    
    func vend() {
        outputView.showCoinsDeposited(machine.coinsDeposited)
        inputView.show(Message.Description.followingBeveragesAvaliable)
        
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
    
    func addExampleBeverages() {
        if machine.isAdministrator {
            try! machine.addItems(maker.exampleBeverages)
        } else {
            machine.switchMode(to: .administrator)
            try! machine.addItems(maker.exampleBeverages)
            machine.switchMode(to: .user)
        }
    }
}

/// 관리자 모드 메소드
extension VendingMachineController: Administrator {
    func removeItem() {
        inputView.show(Message.Question.enterItemNameToRemove)
        let name = inputView.ask(Message.Question.itemName)
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
        let beverage = makeBeverage()
        do {
            try machine.addItem(beverage)
        } catch {
            outputView.showError(error)
            return
        }
    }
}


/// 음료 생성 관련 메소드
extension VendingMachineController: BeverageMakable {
    func makeBeverage() -> Beverage {
        
        let functions = [
            Message.Option.manualCreate: makeBeverageManual,
            Message.Option.selectInOptions: makeBeverageInOptions
        ]
        
        inputView.show(Message.Question.selectCreateOption)
        let makeBeverage = inputView.askForChoice(options: functions.map { $0.value }, showingBy: functions.map { $0.key })
        
        return makeBeverage()
    }
    
    
    func makeBeverageManual() -> Beverage {
        inputView.show(Message.Question.enter(target: "이름"))
        let name = inputView.ask("이름")
        
        inputView.show(Message.Question.enter(target: "가격"))
        let price = inputView.askNumber("가격")
        
        inputView.show(Message.Question.enter(target: "용량"))
        let packageSize = inputView.askNumber("용량")
        
        inputView.show(Message.Question.enter(target: "브랜드"))
        let brand = inputView.ask("브랜드")
        
        inputView.show(Message.Question.enter(target: "유효기간 일 수"))
        let expirationPeriod = inputView.askDays("유효기간")
        
        inputView.show(Message.Question.enter(target: "음료의 온도"))
        let beverageTemperature = inputView.askNumber("온도")
        
        inputView.show(Message.Question.enter(target: "생산 날짜"))
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
        inputView.show(Message.Question.enter(target: "생산 날짜"))
        let dateOfManufacture = inputView.askDate("생산 날짜")
        return make(dateOfManufacture)
    }
    
    func makeMilk(dateOfManufacture: Date) -> Milk {
        inputView.show(Message.Question.choose(target: "우유의 종류"))
        let option = inputView.askForChoice(options: [BeverageMaker.MilkOption.chocolate, .strawberry], showingBy: ["초코 우유", "딸기 우유"])
        
        inputView.show(Message.Question.enter(target: "우유 목장"))
        let milkFactory = inputView.ask("목장")
        return maker.makeMilk(option: option, dateOfManufacture: dateOfManufacture, milkFactory: milkFactory)
    }
    
    func makeSoftDrink(dateOfManufacture: Date) -> SoftDrink {
        inputView.show(Message.Question.choose(target: "탄산 음료의 종류"))
        let option = inputView.askForChoice(options: [BeverageMaker.SoftDrinkOption.cola, .lemonLimeDrink], showingBy: ["콜라", "사이다"])
        return maker.makeSoftDrink(option: option, dateOfManufacture: dateOfManufacture)
    }
    
    func makeCoffee(dateOfManufacture: Date) -> Coffee {
        inputView.show(Message.Question.choose(target: "커피의 종류"))
        let option = inputView.askForChoice(options: [BeverageMaker.CoffeeOption.cantataCoffee, .topCoffee], showingBy: ["칸타타", "TOP"])
        return maker.makeCoffee(option: option, dateOfManufacture: dateOfManufacture)
    }
}
