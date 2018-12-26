//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    var vendingMachine = initializeVendingMachine()
    let startMent = MentMaker.makeStartMent()
    while true {
        let input = InputView.readInput(ment: startMent)
        if VendingMachineMode.managerMode.isEqual(input: input) {
            guard let returnedVendingMachine = managerMode(vendingMachineOfManagerMode: vendingMachine) else {return}
            vendingMachine = returnedVendingMachine
        }
        if VendingMachineMode.userMode.isEqual(input: input) {
            guard let returnedVendingMachine = userMode(vendingMachineOfUserMode: vendingMachine) else {return}
            vendingMachine = returnedVendingMachine
        }
    }
}

private func managerMode(vendingMachineOfManagerMode: VendingMachineManagerFunction) -> VendingMachine? {
    var vendingMachine = vendingMachineOfManagerMode
    while true {
        let addableList = AddableBeverage.allCases
        let inputMent = MentMaker.makeManagerInputMent(addableList: addableList)
        let inputString = InputView.readInput(ment: inputMent)
        if VendingMachineMode.back.isEqual(input: inputString) {
            guard let vendingMachine = vendingMachine as? VendingMachine else {return nil}
            return vendingMachine
        }
        guard ValidChecker.checkManagerInput(string: inputString, countOfBeverage: addableList.count) else {return nil}
        let input = VendingMachineInput(input: inputString)
        
        if input.isModeEqual(1) {
            guard let product = input.readBeverage(addableList: addableList) else {return nil}
            vendingMachine.add(product: product)
        }
        
        if input.isModeEqual(2) {
            vendingMachine.removeExpiredProducts()
            OutputView.show(result: "유통기한이 지난 음료들을 제거하였습니다.\n")
        }
    }
}

private func userMode(vendingMachineOfUserMode: VendingMachineUserFunction) -> VendingMachine? {
    var vendingMachine = vendingMachineOfUserMode
    while true {
        let buyableList = vendingMachine.buyableProductList()
        let inputMent = MentMaker.makeUserInputMent(vendingMachineInfo: vendingMachine)
        let inputString = InputView.readInput(ment: inputMent)
        if VendingMachineMode.back.isEqual(input: inputString) {
            guard let vendingMachine = vendingMachine as? VendingMachine else {return nil}
            return vendingMachine
        }
        guard ValidChecker.checkUserInput(string: inputString, count: buyableList.count) else {return nil}
        let input = VendingMachineInput(input: inputString)
        
        if input.isModeEqual(1) {
            guard let money = input.readMoney() else {return nil}
            vendingMachine.insert(money: money)
        }
        
        if input.isModeEqual(2) {
            let productKeys = Array(buyableList.keys)
            guard let productKey = input.readKey(keys: productKeys) else {return nil}
            guard let boughtProduct = vendingMachine.buy(productName: productKey) else {return nil}
            let postPurchaseMent = MentMaker.makePostPurchaseMent(beverage: boughtProduct)
            OutputView.show(result: postPurchaseMent)
        }
        print("")
    }
}

private func initializeVendingMachine() -> VendingMachine {
    var VM = VendingMachine()
    
    let mandarineMilk = MandarineMilk()
    let lactoseFreeMilk = LactoseFreeMilk()
    let starbucksDoubleShot = StarbucksDoubleShot()
    let topTheBlack = TOPTheBlack()
    let cocaCola = CocaCola()
    let cocaColaZero = CocaColaZero()
    
    VM.add(product: mandarineMilk)
    VM.add(product: lactoseFreeMilk)
    VM.add(product: lactoseFreeMilk)
    VM.add(product: cocaCola)
    VM.add(product: cocaCola)
    VM.add(product: cocaCola)
    VM.add(product: starbucksDoubleShot)
    VM.add(product: starbucksDoubleShot)
    VM.add(product: topTheBlack)
    VM.add(product: cocaColaZero)
    
    return VM
}

main()

