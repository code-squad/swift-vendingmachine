
//
//  BeverageStocks.swift
//  VendingMachine
//
//  Created by 윤동민 on 08/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class DrinkStocks {
    private var stocks: Dictionary<String, [Beverage]> = [:]
    
    // 재고칸 초기화
    init() {
        stocks["\(type(of: BananaMilk.self))"] = []
        stocks["\(type(of: ChocoMilk.self))"] = []
        stocks["\(type(of: Cola.self))"] = []
        stocks["\(type(of: Fanta.self))"] = []
        stocks["\(type(of: Cantata.self))"] = []
        stocks["\(type(of: TOP.self))"] = []
        initialStocks()
    }
    
    private func initialStocks() {
        stocks["\(type(of: BananaMilk.self))"]?.append(BananaMilk(name: "서울우유", volume: 200, brand: "빙그레바나나우유", date: "20190220", fat: true, bananaAmount: 1.1))
        stocks["\(type(of: ChocoMilk.self))"]?.append(ChocoMilk(name: "부산우유", volume: 250, brand: "빙그레초코우유", date: "20190303", fat: true, cocoaAmount: 1.3))
        stocks["\(type(of: ChocoMilk.self))"]?.append(ChocoMilk(name: "남양우유", volume: 230, brand: "빙그레초코우유", date: "20190303", fat: false, cocoaAmount: 1.2))
        stocks["\(type(of: Cola.self))"]?.append(Cola(name: "펩시", volume: 350, brand: "다이어트콜라", date: "20190707", isZeroCalorie: false, sugarAmount: 0.9))
        stocks["\(type(of: Fanta.self))"]?.append(Fanta(name: "환타", volume: 350, brand: "다이어트환타", date: "20191009", isZeroCalorie: false, fantaFlavor: .grape))
        stocks["\(type(of: Cantata.self))"]?.append(Cantata(name: "칸타타", volume: 400, brand: "달달한칸타타", date: "20170801", caffeineAmount: 1.3, material: .plastic))
        stocks["\(type(of: TOP.self))"]?.append(TOP(name: "TOP", volume: 450, brand: "TOP아메리카노", date: "20180505", caffeineAmount: 1.5, topKind: .sweetAmericano))
    }
    
}
