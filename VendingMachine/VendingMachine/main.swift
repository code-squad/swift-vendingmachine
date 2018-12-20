//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func defaultVendingMachine() -> VendingMachine {
    let sampleBeverages = [ChocolateMilk(), ChocolateMilk(), StrawberryMilk(),
                           Sprite(), Sprite(), Sprite(), Pepsi(), Pepsi(), Pepsi(), Pepsi(),
                           Cantata(), Cantata(), Cantata(), Georgia(), Georgia()]
    let vendingMachine = VendingMachine(
        beginningBalance: 2000,
        initialInventory: Inventory(list: [:]))
    sampleBeverages.forEach { beverage in vendingMachine.add(beverage: beverage) }
    return vendingMachine
}

func decideMode(of vendingMachine: VendingMachine) -> Executable {
    while(true) {
        do {
            OutputView.selectMode()
            let input = InputView.readInput()
            let mode = try MenuController.readMode(from: input)
            switch mode {
            case .manager: return ManagerMode(vendingMachine: vendingMachine)
            case .consumer: return ConsumerMode(vendingMachine: vendingMachine)
            }
        } catch let error as MenuError {
            OutputView.showMessage(of: error)
        } catch {
            fatalError("UNEXPECTED ERROR")
        }
    }
}

func main() {
    let vendingMachine = defaultVendingMachine()
    var vendingMachineMode = decideMode(of: vendingMachine)
    vendingMachineMode.run()
}

main()
