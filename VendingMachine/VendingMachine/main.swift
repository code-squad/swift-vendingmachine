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
    
    let vendingMachine = VendingMachine(stockManager: StockManager(stock: [:]))
    let outputView = OutputView(vendingMachine)
    var productTypeList: [ProductType] = []
    
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
            outputView.printBuyableProducts(productTypeList)
            outputView.printMenu()
            let (menu, option) = InputView.selectMenu()
            switch menu {
            case INSERTCOIN:
                vendingMachine.insertMoney(option)
                productTypeList = Formatter.makeProductTypes(vendingMachine.readBuyableProducts())
            case BUYBEVERAGE:
                try outputView.printSoldBeverage(productTypeList[option - 1])
            case QUIT:
                return
            default:
                continue
            }
        } catch let error as VendingMachine.Error {
            print("\(error.errorMessage)")
            continue
        } catch {
            fatalError("unexpected error")
        }
    }
}

main()
