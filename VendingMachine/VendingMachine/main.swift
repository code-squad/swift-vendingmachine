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
        ///mode select
        while true {
            if handleModeState(vendingMachine) {
                vendingMachine.vendingMachineState!.implementStateInstruction()
                break
            }
        }
        /// userMode
        let userMode = UserMode.init(machine: vendingMachine)
        userMode.play()
    }
    
    private static func handleModeState(_ vendingMachine: VendingMachine) -> Bool {
        do {
            printModeSelectMessage(vendingMachine)
            let number = try InputView.readModeSelection()
            let currentState = vendingMachine.vendingMachineState! as! ModeSelectState
            currentState.recieveInstruction(number)
            return true
        }catch(let errorType as VendingMachineError) {
            OutputView.printErrorMessage(errorType)
            return false
        }catch {
            OutputView.printErrorMessage(.unknownError)
            return false
        }
    }
    private static func printModeSelectMessage(_ vendingMachie: VendingMachine){
        OutputView.selectModeInfo()
    }
   
    static func start(){
        let result = MockDrinkCreator.generateBeverages()
        result.forEach { (Drinkable) in
            OutputView.printBeverage(Drinkable)
        }
    }
}
Main.machineStart()
