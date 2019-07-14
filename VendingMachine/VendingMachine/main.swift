//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation
// 서울우유, 200ml, 1000원, 날마다딸기우유, 20171012
// 팹시, 350ml, 2000원, 다이어트콜라, 20171005
// 맥심, 400ml, 3000원, TOP아메리카노, 20171010

class Main {
    static func machineStart(){
        let vendingMachine = initializeVendingMachine()
        while true {
            if vendingMachine.vendingMachineState! is InitialState {
                printInitialStateMessage(vendingMachine)
                vendingMachine.vendingMachineState!.implementStateInstruction()
                continue
            }
            if vendingMachine.vendingMachineState! is ReadyState {
                handleReadyState(vendingMachine)
                vendingMachine.vendingMachineState!.implementStateInstruction()
                continue
            }
            /// common
            let resultPair = vendingMachine.vendingMachineState!.implementStateInstruction()
            guard let printMessage = resultPair.success  else {
                handleError(resultPair.failure)
                continue
            }
            /// if selling
            printSellingStateMessage(vendingMachine, message: printMessage)
        }
    }
    
    private static func handleReadyState(_ vendingMachine: VendingMachine) {
        do {
            printReadyStateMessage(vendingMachine)
            let pair = try InputView.readInstruction()
            let currentState = vendingMachine.vendingMachineState! as! ReadyState
            currentState.recieveInstruction(instruction: pair.instruction, quantity: pair.quantity)
        }catch(let errorType as VendingMachineError) {
            OutputView.printErrorMessage(errorType)
        }catch {
            OutputView.printErrorMessage(.unknownError)
        }
    }
    private static func handleError(_ error: VendingMachineError?){
        guard let errorMessage = error else {
            OutputView.printErrorMessage(VendingMachineError.unknownError)
            return
        }
        OutputView.printErrorMessage(errorMessage)
    }
    private static func printSellingStateMessage(_ vendingMachine: VendingMachine, message: String){
        if vendingMachine.vendingMachineState! is SellingState {
            let sellingInfo = message.components(separatedBy: ",")
            OutputView.printSellingMessage(name: sellingInfo[0], price: sellingInfo[1])
        }
    }
    
    private static func printInitialStateMessage(_ vendingMachine: VendingMachine){
        OutputView.showCurrentBalanceInfo(vendingMachine)
        OutputView.printInitialDrinkMenuList(vendingMachine)
    }
    
    private static func printReadyStateMessage(_ vendingMachine: VendingMachine){
        OutputView.showCurrentBalanceInfo(vendingMachine)
        OutputView.printDrinkMenuListWithNumber(vendingMachine)
        OutputView.selectMenuInfo()
    }
    
    
    
    
    
    
    
    static private func createDrinkItemList(drink: Drink, count: Int ) -> DrinkItemList{
        var drinkList = [Drink]()
        let drinkInfo = BeverageInfo.init(drink: drink)
        for _ in 0..<count{
            drinkList.append(drink)
        }
        let firstItemList = DrinkItemList.init(drinkList: drinkList, stockInfo: drinkInfo)
        return firstItemList
    }
    
    static private func makeDrinkListByType() -> [Drink]{
        let minimumCaloryElements = CaloryElements(carbon: 0, protein: 0, fat: 0)
        let defaultCaloryElements = CaloryElements(carbon: 10, protein: 0, fat: 10)
        let sugarCaloryElements = CaloryElements(carbon: 30, protein: 0, fat: 5)
        let validDate = CustomDateFormatter.convertStringToDate(year: 2019, month: 8, day: 20)
        var drinkList = [Drink]()
        let firstDrink = StrawberryMilk.init(brand: "매일우유", quantity: 500, price: 1000, name: "딸기우유", date: validDate, isLowFat: false, fruitPercent: 3.0, fruitOrigin: "국산", milkFarmCode: .kyunggy, calorySet: defaultCaloryElements, temperature: 4)
        let secondDrink = Coke.init(brand: "펩시", quantity: 500, price: 1500, name: "펩시콜라", date: validDate, sugar: 30, calorySet: sugarCaloryElements, temperature: 5)
        let thirdDrink = BananaMilk.init(brand: "서울우유", quantity: 350, price: 1300, name: "바나나우유", date: validDate, isLowFat: false, bananaPercent: 3, fruitOrigin: "필리핀", milkFarmCode: .kangwon, calorySet: defaultCaloryElements, temperature: 5)
        let fourthDrink = TOPCoffee.init(brand: "맥심", quantity: 450, price: 3000, name: "TOP커피", date: validDate, coffeine: 90, bean: .ethiopia, type: .americano, calorySet: minimumCaloryElements, temperature: 60)
        let fifthDrink = HotSix.init(brand: "롯데칠성", quantity: 250, price: 800, name: "핫식스", date: validDate, sugar: 35, coffeine: 100, taurine: 100, calorySet: sugarCaloryElements, temp: 5)
        
        drinkList.append(firstDrink)
        drinkList.append(secondDrink)
        drinkList.append(thirdDrink)
        drinkList.append(fourthDrink)
        drinkList.append(fifthDrink)
        return drinkList
    }
    
    static private func initializeVendingMachine() -> VendingMachine{
        var drinkTable = [Int: DrinkItemList]()
        var drinkList = makeDrinkListByType()
        for index in 0..<drinkList.count {
            let itemList = createDrinkItemList(drink: drinkList[index], count: Int.random(in: 1...5))
            drinkTable.updateValue(itemList, forKey: index+1)
        }
        let machine = VendingMachine(drinkStockTable: drinkTable)
        return machine
    }
    
    static func start(){
        let result = Main.generateBeverages()
        result.forEach { (Drinkable) in
            OutputView.printBeverage(Drinkable)
        }
    }
    
    /// generate sample Beverages
    static private func generateBeverages() -> [Drinkable]{
        var result = [Drinkable]()
        var calorySet = CaloryElements(carbon: 0, protein: 0, fat: 0)
        var inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 09)
        let seoulStrawberry = StrawberryMilk(brand: "서울우유", quantity: 200, price: 1000, name: "날마다딸기우유", date: inputDate, milkFarmCode: .kangwon, calorySet: calorySet, temperature: 4)
        inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 12)
        let seoulStrawberry2 = StrawberryMilk(brand: "서울우유", quantity: 200, price: 1000, name: "날마다딸기우유", date: inputDate, milkFarmCode: .imported, calorySet: calorySet, temperature: 4)
        inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 05)
        let zeroPepsi = Coke(brand: "펩시", quantity: 350, price: 2000, name: "다이어트콜라", date: inputDate, sugar: 0, calorySet: calorySet, temperature: 10)
        inputDate = CustomDateFormatter.convertStringToDate(year: 2017, month: 10, day: 10)
        let topAmericano = TOPCoffee.init(brand: "맥심", quantity: 400, price: 3000, name: "TOP아메리카노", date: inputDate, coffeine: 120.0, bean: .arabica, type: .americano, calorySet: calorySet, temperature: 20)

        result.append(seoulStrawberry)
        result.append(seoulStrawberry2)
        result.append(zeroPepsi)
        result.append(topAmericano)
        return result
    }
}
Main.machineStart()
