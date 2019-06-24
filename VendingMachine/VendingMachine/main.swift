//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    var vendingMachineMangement = VendingMachineManagement()
    var vendingMachine: VendingMachine
    var menu: Menu
    
    while true {
        OutputView.printVendingMachineStart()
        menu = InputView.readInputToMenu()

        while menu == .menu1 {
            let menuGuide = vendingMachineMangement.getMenu()
            OutputView.printMenuGuide(menuGuide)
            let managementMenu = InputView.readInputToManagementMenu()
            
            if managementMenu == .exit {
                break
            }
            
            if managementMenu == .supply {
                let ableDrinks = vendingMachineMangement.getAbleDrinks()
                OutputView.printDrinks(ableDrinks)
                let drinkIndex = InputView.readInputToInt()
                if drinkIndex <= 0 || drinkIndex > ableDrinks.count {
                    print("없는 인덱스입니다.")
                    continue
                }
                OutputView.printMent("추가할 숫자를 입력해주세요. (최대 100)")
                let drinkAmount = InputView.readInputToInt()
                if drinkAmount <= 0 || drinkAmount > 100 {
                    print("숫자를 잘못 입력하셨습니다.")
                }
                vendingMachineMangement.supply(drinkIndex-1, amount: drinkAmount)
            }
            
            if managementMenu == .getStockList {
                let stock = vendingMachineMangement.getStockList()
                OutputView.printStock(stock)
            }
            
            if managementMenu == .getExpiredDrinkList {
                let expiredDrink = vendingMachineMangement.getExpiredDrinkList()
                OutputView.printDrinks(expiredDrink)
            }
            
            if managementMenu == .getHotDrinkList {
                let hotDrink = vendingMachineMangement.getHotDrinkList()
                OutputView.printDrinks(hotDrink)
            }
        }
        
        vendingMachine = vendingMachineMangement.initVendingMachine()
        
        while menu == .menu2 {
            OutputView.printMenuInputGuidance(vendingMachine)
            let userMenu = InputView.readInputToMenu()
            
            if userMenu == .exit {
                break
            }
            
            do {
                if userMenu == .menu1 {
                    OutputView.printInsertCoinGuidance()
                    let coin = InputView.readInputToInt()
                    vendingMachine.insertCoin(coin)
                    continue
                }
                
                try OutputView.printBuyableDrinkList(vendingMachine)
                let index = InputView.readInputToInt()
                
                let buyableDrinkList = vendingMachine.getBuyableDrinkList()
                
                if index <= 0 || index > buyableDrinkList.count {
                    OutputView.printMent("해당 번호에 해당하는 음료는 없습니다. 번호를 확인해주세요.")
                    continue
                }
                
                try vendingMachine.buy(buyableDrinkList[index-1])
            } catch let error as BuyError {
                OutputView.printMent(error.localizedDescription)
                continue
            }
            catch {
                continue
            }
        }
    }
}

main()
