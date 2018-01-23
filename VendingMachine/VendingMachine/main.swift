//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

enum Mode: Int {
    case admin = 1, user
}
let formatter = DateFormatter()
formatter.dateFormat = "yyyyMMdd"

// 초기 재고 설정
let strawberryMilk: Beverage = StrawberryMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactureDate: formatter.date(from: "20171009") ?? Date(), strawberrySyrup: 5)
let bananaMilk = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "날마다딸기우유", manufactureDate: formatter.date(from: "20171012") ?? Date(), bananaSyrup: 3)
let coke = Coke(brand: "팹시", weight: 350, price: 2000, name: "다이어트콜라", manufactureDate: formatter.date(from: "20171005") ?? Date(), calorie: 25)
let coffee = Top(brand: "맥심", weight: 400, price: 3000, name: "TOP아메리카노", manufactureDate: formatter.date(from: "20171010") ?? Date(), isHotDrink: false)

func run() {
    let isContinue = true
    let vendingMachine = VendingMachine()
    let inputView = InputView()
    let outputView = OutputView()
    
    // 초기 재고 추가
    vendingMachine.addInInventory(beverageName: strawberryMilk, number: 2)
    vendingMachine.addInInventory(beverageName: bananaMilk, number: 1)
    vendingMachine.addInInventory(beverageName: coke, number: 1)
    vendingMachine.addInInventory(beverageName: coffee, number: 1)

    repeat {
        // 관리자, 사용자 선택 메뉴
        outputView.printMachineModeMenu()
        let mode = inputView.selectMachineMode()
        
        if mode == Mode.admin.rawValue {
            AdminController.mode(vendingMachine: vendingMachine)
        }else if mode == Mode.user.rawValue {
            UserController.mode(takeVendingMachine: vendingMachine)
        }
    } while isContinue
}
run()
