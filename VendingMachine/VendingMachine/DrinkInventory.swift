//
//  DrinkInventory.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

/// 주문된 음료 창고에 관련된 기능들
protocol OrderedDrinkInventory {
    func addInventory(undefinedDrink:Drink)->StoredDrinkDetail?
    func getTotalDrinkDetail()->InventoryDetail
}


/// 재고정보를 담당할 구조체. 음료의 정보를 받아서 이름,가격,개수,음료타입
struct StoredDrinkDetail {
    let drinkName : String
    let drinkPrice : Int
    var drinkCount : Int
    let drinkType : DrinkInventory.DrinkType
    
    init(drinkName:String, drinkPrice:Int,drinkCount: Int, drinkType : DrinkInventory.DrinkType){
        self.drinkName = drinkName
        self.drinkPrice = drinkPrice
        self.drinkCount = drinkCount
        self.drinkType = drinkType
    }
    
    func isEnoughDrink(orderCount:Int)->Bool{
        return self.drinkCount >= orderCount
    }
}

/// 재고정보를 배열로 가짐
struct InventoryDetail {
    var storedDrinksDetail : [StoredDrinkDetail] = []
    init(){}
    init(drinkDetails:[StoredDrinkDetail]){
        self.storedDrinksDetail = drinkDetails
    }
    
    /// 재고 출력 메세지
    func getAllDrinkDetails()->String{
        // 결과출력을 위한 변수
        var result = ""
        // 번호를 위한 변수
        var number = 1
        result += ("---현재 구매가능한 음료수---\n")
        for drink in storedDrinksDetail {
            result += ("\(number). \(drink.drinkName)-\(drink.drinkPrice)원-\(drink.drinkCount)개\n")
            number += 1
        }        
        result += ("----------------------")
        return result
    }
    
    mutating func takeDrinkDetail(drinkInventory:StoredDrinkDetail?){
        if let drinkDetail = drinkInventory {
            self.storedDrinksDetail.append(drinkDetail)
        }
    }
}

/// 음료배열을 여러개 가지는 음료창고
class DrinkInventory {
    /// init
    init(){
    }
    /// 음료 종류
    enum DrinkType{
        case
        lowSugarChocoMilk
        ,chocoMilk
        ,coke
        ,zeroCalorieCoke
        ,hotTopCoffee
        ,energyDrink
        ,none
    }
    /// 초코우유 재고
    private let lowSugarChocoMilkInventory = DrinkSlot(drinkType: DrinkInventory.DrinkType.lowSugarChocoMilk)
    private let chocoMilkInventory = DrinkSlot(drinkType: DrinkInventory.DrinkType.chocoMilk)
    
    /// 콜라 재고
    private let cokeInventory = DrinkSlot(drinkType: DrinkInventory.DrinkType.coke)
    private let zeroCalorieCokeInventory = DrinkSlot(drinkType: DrinkInventory.DrinkType.zeroCalorieCoke)
    
    /// 커피 재고
    private let hotTopCoffeeInventory = DrinkSlot(drinkType: DrinkInventory.DrinkType.hotTopCoffee)
    
    /// 에너지드링크 재고
    private let energyDrinkInventory = DrinkSlot(drinkType: DrinkInventory.DrinkType.energyDrink)
    
    /// 음료객체를 받아서 재고정보로 출력
    func getDrinkDetail(drink: Drink)-> StoredDrinkDetail?{
        let inventoryDetail = StoredDrinkDetail(drinkName: drink.name, drinkPrice: drink.price, drinkCount: 1 ,drinkType: drink.drinkType)
        return inventoryDetail
    }
    
    /// 입력받은 타입의 음료를 복사해서 1개 추가한다
    private func duplicate(drinkType:DrinkType)throws{
        switch drinkType {
        case .chocoMilk : try chocoMilkInventory.duplicate()
        case .lowSugarChocoMilk : try lowSugarChocoMilkInventory.duplicate()
        case .coke : try cokeInventory.duplicate()
        case .zeroCalorieCoke : try zeroCalorieCokeInventory.duplicate()
        case .hotTopCoffee : try hotTopCoffeeInventory.duplicate()
        case .energyDrink : try energyDrinkInventory.duplicate()
        case .none : throw OutputView.errorMessage.wrongDrink
        }
    }
    
    /// 해당타입의 음료를 여러번 추가한다
    func addDrinkSelfDuplicate(drinkType:DrinkType,drinkCount:Int)throws{
        for _ in 1...drinkCount {
            try duplicate(drinkType: drinkType)
        }
    }
    
    /// 음료수 객체를 받아서 추가
    func addInventory(undefinedDrink:Drink)throws->StoredDrinkDetail?{
        switch undefinedDrink.drinkType {
        case .chocoMilk : try chocoMilkInventory.addDrink(drink: undefinedDrink)
        case .lowSugarChocoMilk : try lowSugarChocoMilkInventory.addDrink(drink: undefinedDrink)
        case .coke : try cokeInventory.addDrink(drink: undefinedDrink)
        case .zeroCalorieCoke : try zeroCalorieCokeInventory.addDrink(drink: undefinedDrink)
        case .hotTopCoffee : try hotTopCoffeeInventory.addDrink(drink: undefinedDrink)
        case .energyDrink : try energyDrinkInventory.addDrink(drink: undefinedDrink)
        // 추가할수 없는 종류의 경우
        case .none : return nil
        }
        return StoredDrinkDetail(drinkName: undefinedDrink.name, drinkPrice: undefinedDrink.price, drinkCount: 1, drinkType: undefinedDrink.drinkType)
    }
    
    /// 전체 재고 출력 함수
    func getTotalDrinkDetail()->InventoryDetail{
        // 결과 출력용 변수
        var result = InventoryDetail()
        result.takeDrinkDetail(drinkInventory: lowSugarChocoMilkInventory.getDrinkDetail())
        result.takeDrinkDetail(drinkInventory: chocoMilkInventory.getDrinkDetail())
        result.takeDrinkDetail(drinkInventory: cokeInventory.getDrinkDetail())
        result.takeDrinkDetail(drinkInventory: zeroCalorieCokeInventory.getDrinkDetail())
        result.takeDrinkDetail(drinkInventory: hotTopCoffeeInventory.getDrinkDetail())
        result.takeDrinkDetail(drinkInventory: energyDrinkInventory.getDrinkDetail())
        return result
    }
    
    /// 음료 출력
    private func popOneDrink(drinkType:DrinkType)throws->Drink{
        switch drinkType {
        case .chocoMilk : return try chocoMilkInventory.popDrink()
        case .lowSugarChocoMilk : return try lowSugarChocoMilkInventory.popDrink()
        case .coke : return try cokeInventory.popDrink()
        case .zeroCalorieCoke : return try zeroCalorieCokeInventory.popDrink()
        case .hotTopCoffee : return try hotTopCoffeeInventory.popDrink()
        case .energyDrink : return try energyDrinkInventory.popDrink()
        case .none : throw OutputView.errorMessage.wrongDrink
        }
    }
    /// 음료 여러개 출력
    func popDrinks(drinkType:DrinkType,drinkCount:Int)throws->DrinkSlot{
        let drinks = DrinkSlot(drinkType: drinkType)
        for _ in 1...drinkCount {
            try drinks.addDrink(drink: popOneDrink(drinkType: drinkType))
        }
        return drinks
    }    
}




















