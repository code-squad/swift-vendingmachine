//
//  SoldState.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class SellingState: StateTransitionable{
    
    private var selectNumber : Int = 0
    var vendingMachine: VendingMachine
    
    func receiveDrinkNumberInput(_ number: Int){
        selectNumber = number
    }
    
    init(machine: VendingMachine){
        vendingMachine = machine
    }
    
    func moveToNextState(nextTo: StateTransitionable) {
        vendingMachine.changeState(nextTo, from: .sell)
    }

    func selectDrinkNumber(_ number: Int) -> Result<Drink, VendingMachineError>{
        do {
            let soldDrink = try vendingMachine.sellProduct(productId: number)
            return .success(soldDrink)
        }catch(let error as VendingMachineError){
            return .failure(error)
        }catch {
            return .failure(.unknownError)
        }
    }
    
    func implementStateInstruction() -> InstructionResult {
        do {
            guard let result = try? selectDrinkNumber(selectNumber) else {
            }
            let drink = try result.get()
            moveToNextState(nextTo: vendingMachine.readyState)
            let drinkInfoFormat = { (name: String, price: Int) -> (String?, VendingMachineError?) in
                return InstructionResult("\(name), \(price)", nil)
            }
            return drink.displaySoldProductInfo(drinkInfo: drinkInfoFormat)
        } catch let error as VendingMachineError{
            handleSellingStateError(error)
            return InstructionResult(nil, error)
        } catch {
            vendingMachine.changeState(vendingMachine.readyState, from: .sell)
            return InstructionResult(nil, VendingMachineError.unknownError)
        }
    }
    
    private func handleSellingStateError(_ error : VendingMachineError){
        
        switch error {
        case .notEnoughMoneyError:
            vendingMachine.changeState(vendingMachine.readyState, from: .sell)
        case .outOfStockError:
            vendingMachine.changeState(vendingMachine.readyState, from: .sell)
        case .notFoundDrinkIdError:
            vendingMachine.changeState(vendingMachine.readyState, from: .sell)
        default :
            vendingMachine.changeState(vendingMachine.readyState, from: .sell)
        }
    }
    
}
