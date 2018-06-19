//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    
    let INSERTCOIN = 1
    let BUYBEVERAGE = 2
    let QUIT = 0
    
    let vendingMachine = VendingMachine(stockManager: StockManager(stock: [:]), history: History(purchased: []))
    let outputView = OutputView(vendingMachine)
    var buyableProducts: [Products] = []
    
    // 기본 재고 설정
    vendingMachine.add(beverage: StrawberryMilk())
    vendingMachine.add(beverage: StrawberryMilk())
    vendingMachine.add(beverage: StrawberryMilk())
    vendingMachine.add(beverage: ChocoMilk())
    vendingMachine.add(beverage: ChocoMilk())
    vendingMachine.add(beverage: ChocoMilk())
    vendingMachine.add(beverage: Coke())
    vendingMachine.add(beverage: Coke())
    vendingMachine.add(beverage: Coke())
    vendingMachine.add(beverage: TOP())
    vendingMachine.add(beverage: Sprite())

    outputView.printAllStock()
    
    while true {
        do {
            outputView.printBalance()
            outputView.printBuyableProducts()
            outputView.printMenu()
            let (menu, option) = InputView.selectMenu()
            switch menu {
            case INSERTCOIN:
                vendingMachine.insertMoney(option)
                buyableProducts = vendingMachine.readBuyableProducts()
            case BUYBEVERAGE:
                if option > buyableProducts.count { throw StockManager.Error.selectMenuError }
                let soldBeverage = try vendingMachine.buy(buyableProducts[option-1])
                outputView.printSoldBeverage(soldBeverage)
                buyableProducts = vendingMachine.readBuyableProducts()
            case QUIT:
                return
            default:
                continue
            }
        } catch let error as StockManager.Error {
            print("\(error.errorMessage)")
            continue
        } catch let error as VendingMachine.Error {
            print("\(error.errorMessage)")
            continue
        } catch {
            fatalError("unexpected error")
        }
    }
}

main()
