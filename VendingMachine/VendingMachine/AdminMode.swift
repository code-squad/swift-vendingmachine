//
//  AdminMode.swift
//  VendingMachine
//
//  Created by hw on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class AdminMode{
    private var vendingMachine : VendingMachine
    init(machine: VendingMachine){
        self.vendingMachine = machine
    }
    
    func play(){
        while true {
            let value = vendingMachine.vendingMachineState!
            if vendingMachine.vendingMachineState! is AdminInitialState {
                printAdminInitialStateMessage(vendingMachine)
                vendingMachine.vendingMachineState!.implementStateInstruction()
                continue
            }
            if vendingMachine.vendingMachineState! is AdminReadyState {
                if handleReadyState(vendingMachine) {
                    vendingMachine.vendingMachineState!.implementStateInstruction()
                }
                continue
            }
            if vendingMachine.vendingMachineState! is ModeSelectState{
                return
            }
            /// common
            let resultPair = vendingMachine.vendingMachineState!.implementStateInstruction()
            guard let printMessage = resultPair.success  else {
                handleError(resultPair.failure)
                continue
            }
            /// if addStock
            printAddStockStateMessage(vendingMachine, message: printMessage)
        }
    }
    
    private func readDrinkNumberQuantity() throws -> (instruction: Int, quantity: Int) {
        OutputView.printDrinkNumberQuantity()
        let pair = try InputView.readInstruction()
        return pair
    }
    
    private func handleReadyState(_ vendingMachine: VendingMachine) -> Bool{
        var instruction: Int!
        var pair: (instruction: Int, quantity: Int)!
        do {
            printAdminReadyStateMessage(vendingMachine)
            instruction = try InputView.readAdminInstruction()
            let currentState = vendingMachine.vendingMachineState! as! AdminReadyState
            currentState.receiveInstruction(instruction: instruction)
            let pair = try readDrinkNumberQuantity()
            currentState.receiveDrinkStcokInstruction(number: pair.instruction, quantity: pair.quantity)
            return true
        }catch(let errorType as VendingMachineError) {
            OutputView.printErrorMessage(errorType)
            return false
        }catch {
            OutputView.printErrorMessage(.unknownError)
            return false
        }
    }
    
    private func handleError(_ error: VendingMachineError?){
        guard let errorMessage = error else {
            OutputView.printErrorMessage(VendingMachineError.unknownError)
            return
        }
        OutputView.printErrorMessage(errorMessage)
    }
    
    private func printAdminInitialStateMessage(_ vendingMachine: VendingMachine){
        OutputView.showCurrentEarningInfo(vendingMachine)
        OutputView.printInitialDrinkMenuList(vendingMachine)
    }
    
    private func printAdminReadyStateMessage(_ vendingMachine: VendingMachine){
        OutputView.showCurrentEarningInfo(vendingMachine)
        OutputView.printDrinkMenuListWithNumber(vendingMachine)
        print()
        OutputView.selectAdminMenuInfo()
    }
    
    private func printAddStockStateMessage(_ vendingMachine: VendingMachine, message: String){
        if vendingMachine.vendingMachineState! is SellingState {
            let sellingInfo = message.components(separatedBy: ",")
            OutputView.printSellingMessage(name: sellingInfo[0], price: sellingInfo[1])
        }
    }
    
    private func printRemoveStockStateMessage(_ vendingMAchine: VendingMachine, message: String){
        
    }
}
