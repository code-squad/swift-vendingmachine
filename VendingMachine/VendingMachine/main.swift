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
        let vendingMachine = MockVendingMachineCreator.initializeVendingMachine()
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
    
    static func start(){
        let result = MockDrinkCreator.generateBeverages()
        result.forEach { (Drinkable) in
            OutputView.printBeverage(Drinkable)
        }
    }
}
Main.machineStart()
