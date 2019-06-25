//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    var vendingMachineForMangement: VendingMachineManagementable = VendingMachine()
    var vendingMachineForUser: VendingMachineUseable

    var mainMenu: MainMenu
    
    while true {
        OutputView.printVendingMachineStart()
        mainMenu = InputView.readInputToMainMenu()

        while mainMenu == .managementMode {
            let menuGuide = vendingMachineForMangement.getMenu()
            OutputView.printMenuGuide(menuGuide)
            let managementMenu = InputView.readInputToManagementMenu()
            
            if managementMenu == .exit {
                break
            }
            
            if managementMenu == .supply {
                let ableDrinks = vendingMachineForMangement.getAbleDrinks()
                OutputView.printDrinks(ableDrinks)
                let drinkIndex = InputView.readInputToInt()
                if drinkIndex <= 0 || drinkIndex > ableDrinks.count {
                    print(Ment.nonIndex.rawValue)
                    continue
                }
                OutputView.printMent(Ment.supplyAmountGuide.rawValue)
                let drinkAmount = InputView.readInputToInt()
                if drinkAmount <= 0 || drinkAmount > 100 {
                    print(Ment.unableNumber.rawValue)
                }
                vendingMachineForMangement.supply(drinkIndex-1, amount: drinkAmount)
            }
            
            if managementMenu == .getStockList {
                let stock = vendingMachineForMangement.getStockList()
                OutputView.printStock(stock)
            }
            
            if managementMenu == .getExpiredDrinkList {
                let expiredDrink = vendingMachineForMangement.getExpiredDrinkList()
                OutputView.printDrinks(expiredDrink)
            }
            
            if managementMenu == .getHotDrinkList {
                let hotDrink = vendingMachineForMangement.getHotDrinkList()
                OutputView.printDrinks(hotDrink)
            }
        }
        
        vendingMachineForUser = vendingMachineForMangement as! VendingMachineUseable
        
        while mainMenu == .userMode {
            OutputView.printMenuInputGuidance(vendingMachineForUser)
            let userMenu = InputView.readInputToUserMenu()
            
            if userMenu == .exit {
                break
            }
            
            do {
                if userMenu == .inserCoin {
                    OutputView.printInsertCoinGuidance()
                    let coin = InputView.readInputToInt()
                    vendingMachineForUser.insertCoin(coin)
                    continue
                }
                
                try OutputView.printBuyableDrinkList(vendingMachineForUser)
                let index = InputView.readInputToInt()
                
                let buyableDrinkList = vendingMachineForUser.getBuyableDrinkList()
                
                if index <= 0 || index > buyableDrinkList.count {
                    OutputView.printMent(Ment.unableDrinkIndex.rawValue)
                    continue
                }
                
                try vendingMachineForUser.buy(buyableDrinkList[index-1])
            } catch let error as BuyError {
                OutputView.printMent(error.localizedDescription)
                continue
            }
            catch {
                continue
            }
        }
        vendingMachineForMangement = vendingMachineForUser as! VendingMachineManagementable
    }
}

main()
