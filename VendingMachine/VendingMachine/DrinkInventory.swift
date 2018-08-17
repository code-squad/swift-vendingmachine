//
//  DrinkInventory.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

/// 재고정보를 담당할 구조체. 음료의 정보를 받아서 이름,가격,개수 만 저장한다.
struct InventoryDetail {
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
    }
    /// 초코우유 재고
    private var lowSugarChocoMilkInventory : [ChocoMilk] = []
    private var chocoMilkInventory : [ChocoMilk] = []
    
    /// 콜라 재고
    private var cokeInventory : [Coke] = []
    private var zeroCalorieCokeInventory : [Coke] = []
    
    /// 커피 재고
    private var hotTopCoffeeInventory : [TopCoffee] = []
    
    /// 에너지드링크 재고
    private var energyDrinkInventory : [EnergyDrink] = []
    
    // 재고 추가 함수
    /// 저과당 우유인지 아닌지 분류 후 추가
    private func addChocoMilk(chocoMilk: ChocoMilk){
        if chocoMilk.isLowSugar() {
            lowSugarChocoMilkInventory.append(chocoMilk)
        } else {
            chocoMilkInventory.append(chocoMilk)
        }
    }
    /// 제로칼로리 콜라인지 아닌지 분류 후 추가
    private func addCoke(coke: Coke) {
        if coke.isZeroCalorie() {
            zeroCalorieCokeInventory.append(coke)
        } else {
            cokeInventory.append(coke)
        }
    }
    /// 무과당 Top 커피인지 체크 후 추가
    private func addTopCoffee(topCoffee:TopCoffee)->()?{
        if topCoffee.isZeroSugar() {
            hotTopCoffeeInventory.append(topCoffee)
            return ()
        } else {
            return nil
        }
    }
    /// 디카페인인지 체크 후 추가
    private func addEnergyDrink(energyDrink: EnergyDrink)->()?{
        if energyDrink.isNoCaffeine() {
            return nil
        } else {
            energyDrinkInventory.append(energyDrink)
        }
        return ()
    }
    
    /// 따뜻한 top 커피인지 체크
    private func checkHotTopCoffee(topCoffee:TopCoffee)->DrinkType?{
        if topCoffee.isZeroSugar() {
            return DrinkType.hotTopCoffee
        } else {
            return nil
        }
    }
    /// 디카페인이 아닌 에너지음료인지 체크
    private func CheckNoCaffeineEnergyDrink(energyDrink: EnergyDrink)->DrinkType?{
        if energyDrink.isNoCaffeine() {
            return nil
        } else {
            return DrinkType.energyDrink
        }
    }
    
    /// 객체를 받아서 음료종류인지 체크. 맞으면 enum, 아니면 닐 리턴
    func checkDrinkType(drink:Any)->DrinkType?{
        switch drink {
        case is ChocoMilk : return DrinkType.chocoMilk
        case is Coke : return DrinkType.coke
        case is TopCoffee : return checkHotTopCoffee(topCoffee: drink as! TopCoffee)
        case is EnergyDrink : return CheckNoCaffeineEnergyDrink(energyDrink: drink as! EnergyDrink)
        default : return nil
        }
    }
    
    /// 음료수 객체를 받아서 추가
    func addInventory(undefinedDrink:Any)->InventoryDetail?{
        // 객체를 받아서 추가할 수 있는 음료의 종류인지 확인한다
        if let drink = checkDrinkType(drink: undefinedDrink) {
            // 추가할 수 있는 음료면 추가해준다
            switch drink {
            case .chocoMilk,.lowSugarChocoMilk : addChocoMilk(chocoMilk: undefinedDrink as! ChocoMilk)
            case .coke,.zeroCalorieCoke : addCoke(coke: undefinedDrink as! Coke)
            case .hotTopCoffee : addTopCoffee(topCoffee: undefinedDrink as! TopCoffee)
            case .energyDrink : addEnergyDrink(energyDrink: undefinedDrink as! EnergyDrink)
            }
            // 재고정보로 변환하여 리턴한다
            let drinkDetail = undefinedDrink as! Drink
            return InventoryDetail(drinkName: drinkDetail.getName(), drinkPrice: drinkDetail.getPrice(), drinkCount: 1, drinkType: drink)
        }// 추가할수 없는 종류의 경우
        else {
            return nil
        }
    }
    /// 인벤토리별로 재고 출력. 없으면 매진으로 출력
    private func getDrinkInventory(drinkInventory: [Drink])-> InventoryDetail?{
        // 재고가 있을경우
        if let drink = drinkInventory.first {
            let inventoryDetail = InventoryDetail(drinkName: drink.getName(), drinkPrice: drink.getPrice(), drinkCount: drinkInventory.count,drinkType: checkDrinkType(drink: drink)!)
            return inventoryDetail
        } // 없을경우
        else {
            return nil
        }
        
    }
    
    /// 전체 재고 출력 함수
    func getTotalDrinkDetail() -> [InventoryDetail?]{
        // 결과 출력용 변수
        var result : [InventoryDetail?] = []
        result.append(getDrinkInventory(drinkInventory: lowSugarChocoMilkInventory))
        result.append(getDrinkInventory(drinkInventory: chocoMilkInventory))
        result.append(getDrinkInventory(drinkInventory: cokeInventory))
        result.append(getDrinkInventory(drinkInventory: zeroCalorieCokeInventory))
        result.append(getDrinkInventory(drinkInventory: hotTopCoffeeInventory))
        result.append(getDrinkInventory(drinkInventory: energyDrinkInventory))
        return result
    }
    
    /// 따듯한 음료만 리턴
    func getAllHotDrink()->String{
        // result
        var result = ""
        for drink in hotTopCoffeeInventory {
            result += drink.description
        }
        return result
    }
    
    /// 각종 음료의 first를 팝한다. 없으면 닐 리턴
    func popLowSugarChocoMilk()->ChocoMilk?{
        return lowSugarChocoMilkInventory.removeFirst()
    }
    func popChocoMilk()->ChocoMilk?{
        return chocoMilkInventory.removeFirst()
    }
    func popCokeInventory()->Coke?{
        return cokeInventory.removeFirst()
    }
    func popZeroCalorieCokeInventory()->Coke?{
        return zeroCalorieCokeInventory.removeFirst()
    }
    func popHotTopCoffeeInventory()->TopCoffee?{
        return hotTopCoffeeInventory.removeFirst()
    }
    func popEnergyDrinkInventory()->EnergyDrink?{
        return energyDrinkInventory.removeFirst()
    }
}
