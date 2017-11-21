//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let strawBerryMilk = StrawBerryMilk(brand: "서울우유",
                                    weight: "200ml",
                                    price: "1000원",
                                    name: "날마다딸기우유",
                                    dateOfManufacture: "20171009",
                                    calorie: "300kcal",
                                    ingredients: ["strawBerrySyrup"],
                                    ratioOfStrawBerrySyrup: "3.2%")
let bananaMilk = BananaMilk(brand: "서울우유",
                            weight: "200ml",
                            price: "1000원",
                            name: "날마다딸기우유",
                            dateOfManufacture: "20171012",
                            calorie: "350kcal",
                            ingredients: ["bananaSyrup"],
                            ratioOfBananaSyrup: "2.5%")
let coke = Coke(calorie: "200kcal",
                brand: "팹시",
                weight: "350ml",
                price: "2000원",
                name: "다이어트콜라",
                dateOfManufacture: "20171005",
                amountOfSugar: "50g")
let coffee = Coffee(calorie: "150kcal",
                    brand: "맥심",
                    weight: "400ml",
                    price: "3000원",
                    name: "TOP아메리카노",
                    dateOfManufacture: "20171010",
                    isHot: true,
                    amountOfCaffeine: "30mg",
                    nameOfCoffeeBeans: "Colombia")

var vendingMachine = VendingMachine()
let inputView = InputView()
let outputView = Outputview()
var manager = Manager()
var user = User()
do {
    let vendingMachineMode = try inputView.start()
    switch vendingMachineMode {
    case .manager:
        manager.delegate = vendingMachine
    case .user:
        user.delegate = vendingMachine
    }
} catch {
    
}

vendingMachine.add(product: strawBerryMilk!)
vendingMachine.add(product: strawBerryMilk!)
vendingMachine.add(product: bananaMilk!)
vendingMachine.add(product: coke!)
vendingMachine.add(product: coffee!)
outputView.printMonitor(vendingMachine: vendingMachine)

while(true) {
    do {
        let input = try inputView.read()
        switch input.option {
        case .addMoney:
            vendingMachine.add(money: input.detail)
        case .buyDrink:
            let purchaseProduct = try vendingMachine.buy(productIndex: input.detail)
            outputView.printPurchase(drink: purchaseProduct)
        case .extractRemainMoney:
            let change = vendingMachine.extractAllMoney()
            let listOfPurchase = vendingMachine.listOfPurchase()
            outputView.printListOfAllPurchases(listOfPurchase: listOfPurchase, change: change)
        }
        if input.option == .extractRemainMoney { break }
    } catch InputView.InputError.invalidFormat {
        print(InputView.InputError.invalidFormat.rawValue)
    } catch VendingMachine.stockError.soldOut {
        print(VendingMachine.stockError.soldOut.rawValue)
    } catch VendingMachine.stockError.invalidProductNumber {
        print(VendingMachine.stockError.invalidProductNumber.rawValue)
    }
    outputView.printMonitor(vendingMachine: vendingMachine)
}


