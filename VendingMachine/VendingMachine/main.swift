//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main(){
    // 자판기 생성
    var vendingMachine = VendingMachine()
    
    // 음료수 생성
    guard
        let lowSugarChocoMilk  = ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "저과당초코우유", manufacturingDate: "20171009", lowFat: true, lowSugar: true)
        ,
        let hot6 = EnergyDrink(
            barnd: "핫식스", size: 200, price: 1000, name: "핫식스", manufacturingDate: "20171012", zeroCaffeine: false),
        let coke = Coke(barnd: "팹시", size: 350, price: 2000, name: "콜라", manufacturingDate: "20171005", usingPET: false, zeroCalorie: false),
        let topCoffee = TopCoffee(barnd: "맥심", size: 400, price: 3000, name: "TOP아메리카노", manufacturingDate: "20171010", hot: false, zeroSugar: false),
        let chocoMilk  = ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "그냥초코우유", manufacturingDate: "20171009", lowFat: true, lowSugar: false),
        let zeroCalorieCoke = Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDate: "20171005", usingPET: false, zeroCalorie: true)
        else {
            return ()
    }
    // 음료수 추가
    vendingMachine.addDrink(drink: lowSugarChocoMilk)
    vendingMachine.addDrink(drink: lowSugarChocoMilk)
    vendingMachine.addDrink(drink: hot6)
    vendingMachine.addDrink(drink: hot6)
    vendingMachine.addDrink(drink: coke)
    vendingMachine.addDrink(drink: coke)
    vendingMachine.addDrink(drink: zeroCalorieCoke)
    vendingMachine.addDrink(drink: zeroCalorieCoke)
    vendingMachine.addDrink(drink: topCoffee)
    vendingMachine.addDrink(drink: topCoffee)
    vendingMachine.addDrink(drink: chocoMilk)
    vendingMachine.addDrink(drink: chocoMilk)
    
    /// 인풋뷰 선언
    let inputView = InputView()
    /// 아웃풋뷰 선언
    let outputView = OutputView()
    
    outputView.mainMenu()
    /// 첫번째 스텝 진행 순서
    func mainManu()->String{
        outputView.printMoney(money: vendingMachine.getMoney())
        outputView.printGettableDrink(drinks: vendingMachine.getAllInventory())
        let firstMenu = inputView.firstMenu()
        return firstMenu
    }
    /// 돈 추가를 선택시 진행순서
    func insertMoneyStep(){
        if let money = inputView.insertMoney() {
            vendingMachine.plusMoney(money: money)
        }
        else {
            outputView.wrongMoney()
        }
    }
    /// 음료선택시 진행 순서
    func selectDirnk(){
        
    }

    
    while true {        
        let firstMenu = mainManu()
        switch firstMenu {
        case "1" : insertMoneyStep()
        case "2" : selectDirnk()
        case "q" :
            outputView.quitMessage()
            break
        default : outputView.wrongMenu()
        }
        
        
        
    }
    
}


main()

