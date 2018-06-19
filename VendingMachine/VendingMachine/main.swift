//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let expirationDate = DateFormatter()
expirationDate.dateFormat = "yyyyMMdd"
let today = DateFormatter()
today.dateFormat = "yyyyMMdd"

let beverageSet = [
    StrawberryMilk.init("서울우유", 200, 1000, "날마다딸기우유", expirationDate.date(from: "20190701") ?? Date()),
    StrawberryMilk.init("서울우유", 200, 1000, "날마다딸기우유", expirationDate.date(from: "20190701") ?? Date()),
    StrawberryMilk.init("서울우유", 200, 1000, "날마다딸기우유", expirationDate.date(from: "20190701") ?? Date()),
    StrawberryMilk.init("서울우유", 200, 1000, "날마다딸기우유", expirationDate.date(from: "20190701") ?? Date()),
    StrawberryMilk.init("서울우유", 200, 1000, "날마다딸기우유", expirationDate.date(from: "20190701") ?? Date()),
    BananaMilk.init("서울우유", 200, 1000, "날마다바나나우유", expirationDate.date(from: "20190702") ?? Date()),
    ChocoMilk.init("서울우유", 200, 1000, "날마다초코우유", expirationDate.date(from: "20190701") ?? Date()),
    ChocoMilk.init("서울우유", 200, 1000, "날마다초코우유", expirationDate.date(from: "20190702") ?? Date()),
    Coke.init("팹시", 350, 2000, "다이어트콜라", expirationDate.date(from: "20181005") ?? Date()),
    Coke.init("팹시", 350, 2000, "다이어트콜라", expirationDate.date(from: "20181005") ?? Date()),
    Sprite.init("스프라이트", 300, 1500, "스프라이트", expirationDate.date(from: "20181015") ?? Date()),
    Sprite.init("스프라이트", 300, 1500, "스프라이트", expirationDate.date(from: "20181015") ?? Date()),
    Fanta.init("환타", 350, 2500, "파인", expirationDate.date(from: "20181011") ?? Date()),
    Top.init("맥심", 400, 3000, "TOP아메리카노", expirationDate.date(from: "20181010") ?? Date()),
    Top.init("맥심", 400, 3000, "TOP아메리카노", expirationDate.date(from: "20181010") ?? Date()),
    Cantata.init("칸타타", 400, 3000, "아메리카노", expirationDate.date(from: "20181110") ?? Date()),
    Georgia.init("조지아", 350, 2500, "카페라떼", expirationDate.date(from: "20181015") ?? Date()),
    Georgia.init("조지아", 350, 2500, "카페라떼", expirationDate.date(from: "20181015") ?? Date())
]

var vendingMachine = Vendingmachine.init(beverageSet)

for beverage in beverageSet {
    print(vendingMachine.countOfInventory(beverage.kind))
}


//while true {
//    let inputView = InputView()
//    let outputView = OutputView()
//    var vendingmachine = Vendingmachine()
//    let inputCoin = inputView.inputCoin()
//    let addCoin = vendingmachine.addBalance(inputCoin)
//    let balance = vendingmachine.checkBalance()
//    let showInfo = outputView.showInformation(balance)
//}
