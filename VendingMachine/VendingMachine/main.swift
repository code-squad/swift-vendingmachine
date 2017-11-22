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
let drinkList = [strawBerryMilk!, bananaMilk!, coke!, coffee!]
var vendingMachine = VendingMachine(drinkList: drinkList)
let inputView = InputView()
let outputView = Outputview()
var modeOfVendingMachine: EnableMode!
var start = false
while(true) {
    do {
        if !start {
            // 한번만 실행. 자판기 모드를 할당해준다.
            let mode = try inputView.readMode()
            start = true
            modeOfVendingMachine = try Connector.assignMode(target: vendingMachine, mode: mode)
        }
        let menu = modeOfVendingMachine.makeMenu()
        
        let input = try inputView.read()
        
    } catch InputView.InputError.invalidFormat {
        print(InputView.InputError.invalidFormat.rawValue)
    } catch VendingMachine.stockError.soldOut {
        print(VendingMachine.stockError.soldOut.rawValue)
    } catch VendingMachine.stockError.invalidProductNumber {
        print(VendingMachine.stockError.invalidProductNumber.rawValue)
    }
}
