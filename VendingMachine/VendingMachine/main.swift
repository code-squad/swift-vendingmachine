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
    let sprite = Sprite(sugarContent: 0, volume: 200, price: 800, name: "스프라이트", manufacturingDate: "20171215", labelColor: "GREEN", forBusiness: false)
    let ceylonTea = CeylonTea(volume: 250, price: 500, manufacturingDate: "20171215")
    let box = [lightBananaMilk, realBananaMilk, originalCoke, coffee, sprite, ceylonTea, originalCoke2]
    return box
}

func getSpareBox() -> [Beverage] {
    let lightBananaMilk2 = LightBananaMilk(volume: 270, price: 1200, manufacturingDate: "20171213")
    let realBananaMilk2 = RealBananaMilk(volume: 270, price: 1400, manufacturingDate: "20171212")
    let originalCoke2 = Coke(sugarContent: 80, volume: 250, price: 700, name: "CoCaCola", manufacturingDate: "20171213", labelColor: "RED", forBusiness: false)
    let coffee2 = StarBucksCoffee(reserve: true, caffeine: true, temperature: 97, volume: 500, price: 5600, name: "스타벅스아메리카노", manufacturingDate: "20171213")
    let sprite2 = Sprite(sugarContent: 0, volume: 200, price: 800, name: "스프라이트", manufacturingDate: "20171215", labelColor: "GREEN", forBusiness: false)
    let ceylonTea2 = CeylonTea(volume: 250, price: 500, manufacturingDate: "20171215")
    let box = [lightBananaMilk2, realBananaMilk2, originalCoke2, coffee2, sprite2, ceylonTea2]
    return box
}

func executeMain(box: [Beverage]) {
    let vendingMachineData = VendingMachineData(stock: box)
    var spareBox = getSpareBox()
    var condition = true
    while condition {
        do {
            switch try InputView.readMode() {
            case .adminMode:
                var adminController = AdminController(with: vendingMachineData)
                try adminController.executeMachine(spareStock: &spareBox)
            case .userMode:
                var userController = UserController(with: vendingMachineData)
                try userController.executeMachine()
            }
        } catch ErrorCode.endCode {
            AdminOutputView.printError(ErrorCode.endCode.description)
            condition = false
        } catch let error as ErrorCode {
            AdminOutputView.printError(error.description)
        } catch {
            AdminOutputView.printError(ErrorCode.inValidError.description)
        }
    }
    
}

executeMain(box: getBox())
