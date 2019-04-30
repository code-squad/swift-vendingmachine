//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    // motion: 자판기 작동을 위한 변수
    var motion = true
    let beverages = [Sprite(), Sprite(), Sprite(), CocaCola(), CocaCola(), CocaCola(), CocaCola(),ChocolateMilk(), ChocolateMilk(), BananaMilk(),CantataCoffee(), CantataCoffee(), CantataCoffee(), StarbucksCoffee(),StarbucksCoffee()]
    
    var vendingMachine = VendingMachine(startMoney: 0, list: Inventory(list: [:]))

    beverages.forEach {
        beverage in vendingMachine.add(beverage: beverage)
    }
    
    while(motion == true) {
        do {
            try OutputView.start(vendingMachine)
            let data = InputView.readInput()
            let menu = try Menu.readCustomerMenu(input: data)
            
            switch menu.details {
                case .returnChange:
                    OutputView.moneyReturn(vendingMachine)
                    motion = false
                case .addMoney:
                    let moneyInserted = menu.value
                
                    guard vendingMachine.isPut(cash: moneyInserted) else { continue }
                    OutputView.showInsertion(money: moneyInserted)
                case .buyBeverage:
                    let listBuyable = vendingMachine.buyAvailableList()
                    
                    let selectedBeverage = menu.value - 1
                    guard selectedBeverage < listBuyable.count else { throw MenuError.noNumberGoods }
                    
                    let selectedGoods = listBuyable[selectedBeverage]
                    guard let beveragePurchas = vendingMachine.buyBeverage(package: selectedGoods) else { continue }
                    
                    OutputView.showPurchase(beverage: beveragePurchas)
                
            }
            } catch let meg as MenuError {
                OutputView.showMessage(error : meg)
            } catch {
                OutputView.showMessage(error: MenuError.notDefine)
            }
    }
    
}

//main()

func selectMode(vendingMachine: VendingMachine) -> SelectMode? {
    while true {
        do {
            OutputView.selectMode()
            let inputData = InputView.readInput()
            if Menu.moveHighStep(input: inputData) { return nil }
            let userPick = try Menu.readUserMode(input: inputData)
            switch userPick {
            case .manager:
                return ManagerMode(vendingMachine: vendingMachine)
            case .customer:
                return CustomerMode(vendingMachine: vendingMachine)
            }
        } catch let error as MenuError {
            OutputView.showMessage(error: error)
        } catch {
            OutputView.showMessage(error: MenuError.notDefine)
        }
    }
}

func testMain() {
    var motion = true
    let beverages = [Sprite(), Sprite(), Sprite(), CocaCola(), CocaCola(), CocaCola(), CocaCola(),ChocolateMilk(), ChocolateMilk(), BananaMilk(),BananaMilk(),CantataCoffee(), CantataCoffee(), CantataCoffee(), StarbucksCoffee(),StarbucksCoffee()]
    
    var vendingMachine = VendingMachine(startMoney: 0, list: Inventory(list: [:]))
    
    beverages.forEach {
        beverage in vendingMachine.add(beverage: beverage)
    }
    
    while motion {
        guard var userPick = selectMode(vendingMachine: vendingMachine) else { return }
        userPick.perform()
    }
}

testMain()
