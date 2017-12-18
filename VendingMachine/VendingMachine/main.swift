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
    var vendingMachine = VendingMachine(stock: box)
    OutputView.printMainMenu(machine: vendingMachine)
    let condition = true
    while condition {
        do {
            vendingMachine = try Controller.executeVandingMachine(machine: vendingMachine, inputSelector: try InputView.read())
        } catch let error as ErrorCode {
            OutputView.printError(error.description)
        } catch {
            OutputView.printError(ErrorCode.inValidError.description)
        }
    }
}

executeMain(box: getBox())
