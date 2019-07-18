//
//  CommonOutputView.swift
//  VendingMachine
//
//  Created by hw on 18/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CommonOutputView {
    static func printErrorMessage(_ error: VendingMachineError){
        print("================")
        print(error.description)
        print("================")
    }
    
    static func selectModeInfo(){
        print("자판기를 시작합니다.")
        print("\(ModeType.adminMode.description)")
        print("\(ModeType.userMode.description)")
    }
    
    static func printDrinkMenuListWithNumber (_ vendingmachine: VendingMachine){
        let drinkStockInfoFormat = {
            (sortedMenutable: [(key: Int, value: DrinkItemList)]) in
            sortedMenutable.forEach{ (key: Int, value: DrinkItemList) in
                print("\(key)) \(value.description) ")
            }
        }
        vendingmachine.displayDrinkMenuList(printFormat: drinkStockInfoFormat)
    }
    
    static func printInitialDrinkMenuList(_ vendingmachine: VendingMachine){
        let printDrinkMenuListFormat = {
            (sortedMenutable: [(key: Int, value: DrinkItemList)]) in
            print("=>", terminator: " ")
            sortedMenutable.forEach{ (key: Int, value: DrinkItemList) in
                print( "\(value.drinkName)(\(value.drinkStockList.count)개)", terminator: " ")
            }
            print()
        }
        vendingmachine.displayDrinkMenuList(printFormat: printDrinkMenuListFormat)
    }
}
