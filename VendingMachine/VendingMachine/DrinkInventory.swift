//
//  DrinkInventory.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

/// 재고정보를 담당할 구조체. 음료의 정보를 받아서 이름,가격,개수 만 저장한다.
struct InventoryDetail  {
    private let drinkName : String
    private let drinkPrice : Int
    private var drinkNumber : Int
    
    init(drinkName:String, drinkPrice:Int,drinkNumber: Int){
        self.drinkName = drinkName
        self.drinkPrice = drinkPrice
        self.drinkNumber = drinkNumber
    }
    
    func getDrinkName()->String{
        return self.drinkName
    }
    func getDrinkPrice()->Int{
        return self.drinkPrice
    }
    func getDrinkNumber()->Int{
        return self.drinkNumber
    }
}


class DrinkInventory {
    /// init
    init(){
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
    
    /// 음료수 객체를 받아서 추가
    func addInventory(drink:Any)->()?{
        switch drink {
        case is ChocoMilk : addChocoMilk(chocoMilk: drink as! ChocoMilk)
        case is Coke : addCoke(coke: drink as! Coke)
        case is TopCoffee : addTopCoffee(topCoffee: drink as! TopCoffee)
        case is EnergyDrink : addEnergyDrink(energyDrink: drink as! EnergyDrink)
        default : return nil
        }
        return ()
    }
    /// 인벤토리별로 재고 출력. 없으면 매진으로 출력
    private func getDrinkInventory(drinkInventory: [Drink])-> InventoryDetail?{
        // 재고가 있을경우
        if let drink = drinkInventory.first {
            let inventoryDetail = InventoryDetail(drinkName: drink.getName(), drinkPrice: drink.getPrice(), drinkNumber: drinkInventory.count)
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
