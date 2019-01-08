
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
    
    func add(_ drink: Beverage) {
        stocks["\(type(of: drink))"]?.append(drink)
    }
    
    func isExist(_ menu: Int) -> Bool {
        return  menu > 0 && menu <= stocks.count
    }
    
    func isEmptyStock(_ menu: Int) -> Bool {
        return stocks[selectBy(menu)]?.isEmpty ?? true
    }
    
    private func selectBy(_ menu: Int) -> String {
        switch menu {
        case 1: return "\(type(of: BananaMilk.self))"
        case 2: return "\(type(of: ChocoMilk.self))"
        case 3: return "\(type(of: Cola.self))"
        case 4: return "\(type(of: Fanta.self))"
        case 5: return "\(type(of: Cantata.self))"
        case 6: return "\(type(of: TOP.self))"
        default: return ""
        }
    }
    
    func getPrice(menu: Int) -> Int {
        return stocks[selectBy(menu)]![0].price
    }
    
    func pickOneDrink(menu: Int) -> Beverage {
        return stocks[selectBy(menu)]!.remove(at: 0)
    }
    
    func getPurchaseList(with coin: Coin) -> [String] {
        var purchaseList: [String] = []
        for (key, value) in stocks {
            if !value.isEmpty && coin.isEnoughToBuy(of: value[0].price) { purchaseList.append(key) }
        }
        return purchaseList
    }
    
    func searchExpirationList(to todayDate: Date) -> [Beverage] {
        var past: [Beverage] = []
        for (_, value) in stocks {
            for drink in value { if drink.menufactureOfDate < todayDate { past.append(drink) } }
        }
        return past
    }
    
    func count() -> Dictionary<String, Int> {
        var stockCount: [String:Int] = [:]
        stockCount["\(type(of: BananaMilk.self))"] = stocks["\(type(of: BananaMilk.self))"]?.count
        stockCount["\(type(of: ChocoMilk.self))"] = stocks["\(type(of: ChocoMilk.self))"]?.count
        stockCount["\(type(of: Cola.self))"] = stocks["\(type(of: Cola.self))"]?.count
        stockCount["\(type(of: Fanta.self))"] = stocks["\(type(of: Fanta.self))"]?.count
        stockCount["\(type(of: Cantata.self))"] = stocks["\(type(of: Cantata.self))"]?.count
        stockCount["\(type(of: TOP.self))"] = stocks["\(type(of: TOP.self))"]?.count
        return stockCount
    }
    
    func stockCount() -> Int {
        return stocks.count
    }
    
    func convertStringDrink(index: Int) -> String {
        return "\(index)) \(selectBy(index)) \(getPrice(menu: index))원 \(stocks[selectBy(index)]!.count)개"
    }
}
