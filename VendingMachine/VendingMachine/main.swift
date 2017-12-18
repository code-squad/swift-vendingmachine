//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func getBox() -> [Beverage] {
    let lightBananaMilk = LightBananaMilk(volume: 270, price: 1200, manufacturingDate: "20171213")
    let realBananaMilk = RealBananaMilk(volume: 270, price: 1400, manufacturingDate: "20171212")
    let originalCoke = Coke(sugarContent: 80, volume: 250, price: 700, name: "CoCaCola", manufacturingDate: "20171213", labelColor: "RED", forBusiness: false)
    let originalCoke2 = Coke(sugarContent: 80, volume: 250, price: 700, name: "CoCaCola", manufacturingDate: "20171213", labelColor: "RED", forBusiness: false)
    let coffee = StarBucksCoffee(reserve: true, caffeine: true, temperature: 97, volume: 500, price: 5600, name: "스타벅스아메리카노", manufacturingDate: "20171213")
    let sprite = Sprite(sugarContent: 0, volume: 200, price: 800, name: "선배! 스프라이트 샤워하실래요?", manufacturingDate: "20171215", labelColor: "GREEN", forBusiness: false)
    let ceylonTea = CeylonTea(volume: 250, price: 500, manufacturingDate: "20171215")
    let box = [lightBananaMilk, realBananaMilk, originalCoke, coffee, sprite, ceylonTea, originalCoke2]
    return box
}

func executeMain(box: [Beverage]) {
    let vendingMachine = VendingMachine(stock: box)
    let outputView = OutputView(vendingMachine)
    var userController = UserController(machine: vendingMachine, view: outputView)
    outputView.printMainMenu()
    
    var condition = true
    while condition {
        do {
            try userController.executeMachine(inputSelector: try InputView.read())
        } catch ErrorCode.endCode {
            condition = false
        } catch let error as ErrorCode {
            outputView.printError(error.description)
        } catch {
            outputView.printError(ErrorCode.inValidError.description)
        }
    }
}

executeMain(box: getBox())
