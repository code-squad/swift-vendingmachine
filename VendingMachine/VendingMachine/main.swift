//
//  main.swift
//  VendingMachine
//
//  Created by Jack (2018/01/15)
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let form = DateFormatter()
form.dateFormat = "yyyyMMdd"

let baseProductsBox = [
    StrawberryMilk("서울우유", "날마다딸기우유", 200, 1000, form.date(from: "20180117") ?? Date()),
    StrawberryMilk("서울우유", "날마다딸기우유", 200, 1000, form.date(from: "20180117") ?? Date()),
    StrawberryMilk("서울우유", "날마다딸기우유", 200, 1000, form.date(from: "20180117") ?? Date()),
    BananaMilk("서울우유", "날마다바나나우유", 200, 1000, form.date(from: "20170117") ?? Date()),
    BananaMilk("서울우유", "날마다바나나우유", 200, 1000, form.date(from: "20170117") ?? Date()),
    PepciCoke("코카콜라", "다이어트콜라", 350, 2000, form.date(from: "20170110") ?? Date(), lowCalorie: true),
    PepciCoke("코카콜라", "다이어트콜라", 350, 2000, form.date(from: "20170110") ?? Date(), lowCalorie: true),
    PepciCoke("코카콜라", "다이어트콜라", 350, 2000, form.date(from: "20170110") ?? Date(), lowCalorie: true),
    PepciCoke("코카콜라", "다이어트콜라", 350, 2000, form.date(from: "20170110") ?? Date(), lowCalorie: true),
    PepciCoke("코카콜라", "다이어트콜라", 350, 2000, form.date(from: "20170110") ?? Date(), lowCalorie: true),
    Fanta("환타", "환타오렌지", 350, 2000, form.date(from: "20170109") ?? Date(), lowCalorie: false),
    Fanta("환타", "환타오렌지", 350, 2000, form.date(from: "20170109") ?? Date(), lowCalorie: false),
    Fanta("환타", "환타오렌지", 350, 2000, form.date(from: "20170109") ?? Date(), lowCalorie: false),
    TOPCoffee("맥심", "TOP아메리카노", 400, 3000, form.date(from: "20170117") ?? Date(), hot: false),
    TOPCoffee("맥심", "TOP아메리카노", 400, 3000, form.date(from: "20170117") ?? Date(), hot: false),
    TOPCoffee("맥심", "TOP아메리카노", 400, 3000, form.date(from: "20170117") ?? Date(), hot: false),
    Georgia("맥심", "조지아카페모카", 450, 3500, form.date(from: "20170119") ?? Date(), hot: true),
    Georgia("맥심", "조지아카페모카", 450, 3500, form.date(from: "20170119") ?? Date(), hot: true),
    ]

var vendingMachine = VendingMachine(productsBox: baseProductsBox)
var runVendingMachine : Bool = true
let inputView : InputView = InputView()
let outputView : OutputView = OutputView()
while runVendingMachine {
    
    outputView.printBaseMessages(vendingMachine)
    let userInput = inputView.readMenu()
    if userInput == .invalidMenu {
        outputView.printMessage(.invalidMenu)
        continue
    }
    guard userInput != .exit else { break }
    
    switch userInput {
    case .addMoney :
        outputView.printMessage(.addMoney)
        vendingMachine.addMoney(InputView().readMoney())
    case .buyDrink :
        outputView.printMessage(.chooseProduct)
        let userProductNumber = inputView.readProductNumber()
        if userProductNumber == .invalidNumber  {
            outputView.printMessage(.invalidMenu)
        }
        let userProductName = vendingMachine.getProductNumbersAndKinds()[userProductNumber.rawValue] ?? ""
        let userProduct = vendingMachine.getInventory()[userProductName]?.first
        if vendingMachine.generateListOfValidProduct().contains(userProductName) {
            vendingMachine.buy(userProductName)
            outputView.printBuyProduct(userProductName, productPrice: userProduct?.price ?? 0)
            continue
        }
        outputView.printMessage(.shortOfMoney)
    case .history :
        print(vendingMachine.generateListOfHistory())
    default :
        break
    }
}



