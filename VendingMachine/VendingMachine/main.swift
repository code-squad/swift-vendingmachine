//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let bananaMilk = BananaMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190301", farmCode: 5, expirationDate: "20190930")
    let strawberryMilk = StrawberryMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190405", farmCode: 3, expirationDate: "20190925")
    let fanta = Fanta(brand: "롯데", ml: 350, price: 2000, productDate: "20190505", orangeIncense: 0.7, expirationDate: "20190921")
    let top = TOP(brand: "맥심", ml: 400, price: 3000, productDate: "20190606", hot: false, expirationDate: "20190920")
    let hot6 = Hot6(brand: "롯데", ml: 240, price: 1000, productDate: "20190529", expirationDate: "20191029")
    let pepsiCoke = PepsiCoke(brand: "펩시", ml: 255, price: 1200, productDate: "20190610", expirationDate: "20191010")
    var vendingMachine = VendingMachine()
    let inputView = InputView()
    var menu: Menu
    var input: String
    
    vendingMachine.supply(bananaMilk, amount: 20)
    vendingMachine.supply(strawberryMilk, amount: 20)
    vendingMachine.supply(fanta, amount: 10)
    vendingMachine.supply(top, amount: 20)
    vendingMachine.supply(hot6, amount: 6)
    vendingMachine.supply(pepsiCoke, amount: 30)
    
    while true {
        input = inputView.readInput(vendingMachine)
        menu = MenuChecker.checkMenu(input)
        
        if menu == .exit {
            return
        }
        
        do {
            if menu == .insertCoin {
                OutputView.printInsertCoinGuidance()
                let coin = InputView.readInputToCoin()
                vendingMachine.insertCoin(coin)
                continue
            }
            
            try OutputView.printBuyableDrinkList(vendingMachine)
            let index = InputView.readInputToDrinkIndex()
            
            let buyableDrinkList = vendingMachine.getBuyableDrinkList()
            
            if index <= 0 || index > buyableDrinkList.count {
                throw BuyError.NonHaveIndex
            }
                
            try vendingMachine.buy(buyableDrinkList[index-1])
        } catch let error as BuyError {
            print(error.localizedDescription)
            continue
        }
        catch {
            print(error)
            continue
        }
    }
}

main()
