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
        self.selectNumber = number
    }
    
    init(machine: VendingMachine){
        self.vendingMachine = machine
    }
    
    func moveToNextState(nextTo: StateTransitionable) {
        self.vendingMachine.changeState(nextTo, from: .sell)
    }

    func selectDrinkNumber(_ number: Int) -> Result<Drink, VendingMachineError>{
        do {
            let soldDrink = try self.vendingMachine.sellProduct(productId: number)
            return .success(soldDrink)
        }catch(let error as VendingMachineError){
            return .failure(error)
        }catch {
            return .failure(.unknownError)
        }
    }
    
    func implementStateInstruction() {
        do {
            guard let result = try? selectDrinkNumber(selectNumber) else {
                return
            }
            let drink = try result.get()
            OutputView.printSellingMessage(drink)
        } catch let error as VendingMachineError{
            handleSellingStateError(error)
        } catch {
            OutputView.printErrorMessage(.unknownError)
            self.vendingMachine.changeState(self.vendingMachine.readyState, from: .sell)
        }
        moveToNextState(nextTo: self.vendingMachine.readyState)
    }
    
    private func handleSellingStateError(_ error : VendingMachineError){
        OutputView.printErrorMessage(error)
        switch error {
        case .notEnoughMoneyError:
            self.vendingMachine.changeState(self.vendingMachine.readyState, from: .sell)
        case .outOfStockError:
            self.vendingMachine.changeState(self.vendingMachine.readyState, from: .sell)
        case .notFoundDrinkIdError:
            self.vendingMachine.changeState(self.vendingMachine.readyState, from: .sell)
        default :
            self.vendingMachine.changeState(self.vendingMachine.readyState, from: .sell)
        }
    }
    
}
