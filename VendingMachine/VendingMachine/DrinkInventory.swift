//
//  DrinkInventory.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

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
    
    /// 초코우유를 받아서 저과당인지 아닌지 음료타입 리턴
    private func checkChocoMilkType(chocoMilk:ChocoMilk)->DrinkType{
        if chocoMilk.lowSugar {
            return DrinkType.lowSugarChocoMilk
        } else {
            return DrinkType.chocoMilk
        }
    }
    /// 콜라를 받아서 제로칼롤리인지 아닌지 음료타입 리턴
    private func checkCokeType(coke:Coke)->DrinkType{
        if coke.isZeroCalorie() {
            return DrinkType.zeroCalorieCoke
        } else {
            return DrinkType.coke
        }
    }
    /// 따뜻한 top 커피인지 체크
    private func checkTopCoffeeType(topCoffee:TopCoffee)->DrinkType?{
        if topCoffee.isZeroSugar() {
            return DrinkType.hotTopCoffee
        } else {
            return nil
        }
    }
    /// 디카페인이 아닌 에너지음료인지 체크
    private func CheckNEnergyDrinkType(energyDrink: EnergyDrink)->DrinkType?{
        if energyDrink.isNoCaffeine() {
            return nil
        } else {
            return DrinkType.energyDrink
        }
    }
    
    /// 객체를 받아서 음료종류인지 체크. 맞으면 enum, 아니면 닐 리턴
    func checkDrinkType(drink:Any)->DrinkType?{
        switch drink {
        case is ChocoMilk : return checkChocoMilkType(chocoMilk: drink as! ChocoMilk)
        case is Coke : return checkCokeType(coke: drink as! Coke)
        case is TopCoffee : return checkTopCoffeeType(topCoffee: drink as! TopCoffee)
        case is EnergyDrink : return CheckNEnergyDrinkType(energyDrink: drink as! EnergyDrink)
        default : return nil
        }
    }
    
    /// 음료수 객체를 받아서 추가
    func addInventory(undefinedDrink:Any)->StoredDrinkDetail?{
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
            return StoredDrinkDetail(drinkName: drinkDetail.getName(), drinkPrice: drinkDetail.getPrice(), drinkCount: 1, drinkType: drink)
        }// 추가할수 없는 종류의 경우
        else {
            return nil
        }
    }
    /// 인벤토리별로 재고 출력. 없으면 매진으로 출력
    private func getDrinkDetail(drinkInventory: [Drink])-> StoredDrinkDetail?{
        // 재고가 있을경우
        if let drink = drinkInventory.first {
            let inventoryDetail = StoredDrinkDetail(drinkName: drink.getName(), drinkPrice: drink.getPrice(), drinkCount: drinkInventory.count,drinkType: checkDrinkType(drink: drink)!)
            return inventoryDetail
        } // 없을경우
        else {
            return nil
        }
        
    }
    
    /// 전체 재고 출력 함수
    func getTotalDrinkDetail() -> InventoryDetail{
        // 결과 출력용 변수
        var result = InventoryDetail()
        if let drinkDetail = getDrinkDetail(drinkInventory: lowSugarChocoMilkInventory) {
            result.storedDrinksDetail.append(drinkDetail)
        }
        if let drinkDetail = getDrinkDetail(drinkInventory: chocoMilkInventory) {
            result.storedDrinksDetail.append(drinkDetail)
        }
        if let drinkDetail = getDrinkDetail(drinkInventory: cokeInventory) {
            result.storedDrinksDetail.append(drinkDetail)
        }
        if let drinkDetail = getDrinkDetail(drinkInventory: zeroCalorieCokeInventory) {
            result.storedDrinksDetail.append(drinkDetail)
        }
        if let drinkDetail = getDrinkDetail(drinkInventory: hotTopCoffeeInventory) {
            result.storedDrinksDetail.append(drinkDetail)
        }
        if let drinkDetail = getDrinkDetail(drinkInventory: energyDrinkInventory) {
            result.storedDrinksDetail.append(drinkDetail)
        }
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
