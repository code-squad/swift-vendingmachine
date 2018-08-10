//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 7. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

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
    
    /// 전체 재고 출력 함수
    func getTotalDrinkDetail() -> String{
        // 결과 출력용 변수
        var result = ""
        if let drink = lowSugarChocoMilkInventory.first {
            result += "\(drink.getName())-\(drink.getPrice())원-\(lowSugarChocoMilkInventory.count)개\n"
        }
        if let drink = chocoMilkInventory.first {
            result += "\(drink.getName())-\(drink.getPrice())원-\(chocoMilkInventory.count)개\n"
        }
        if let drink = cokeInventory.first {
            result += "\(drink.getName())-\(drink.getPrice())원-\(cokeInventory.count)개\n"
        }
        if let drink = zeroCalorieCokeInventory.first {
            result += "\(drink.getName())-\(drink.getPrice())원-\(zeroCalorieCokeInventory.count)개\n"
        }
        if let drink = hotTopCoffeeInventory.first {
            result += "\(drink.getName())-\(drink.getPrice())원-\(hotTopCoffeeInventory.count)개\n"
        }
        if let drink = energyDrinkInventory.first {
            result += "\(drink.getName())-\(drink.getPrice())원-\(energyDrinkInventory.count)개\n"
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
    
    /// 각종 음료의 마지막을 팝한다. 없으면 닐 리턴
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

class VendingMachine {
    /// 자판기에 들어있는 금액
    private var insertedMoney = 0
    
    /// 금액 추가 함수
    func plusMoney(money:Int){
        self.insertedMoney += money
    }
    /// 금액 사용 함수
    func minusMoney(money:Int){
        self.insertedMoney -= money
    }
    /// 금액 확인 함수
    func getMoney()->Int{
        return self.insertedMoney
    }
    
    /// 재고창고
    private var drinkInventory = DrinkInventory()
    
    /// 주문한 음료수가 쌓이는 곳
    private var orderedDrinks : [Drink] = []
    
    /// 주문한 음료수 전체 내용 리턴
    func getOrederdDrinks()->[Drink]{
        return orderedDrinks
    }
    
    /// 종류별 음료수 주문
    func orderLowSugarChocoMilk()->()?{
        // 재고가 없으면 닐 리턴
        guard let drink = drinkInventory.popLowSugarChocoMilk() else {
            return nil
        }
        orderedDrinks.append(drink)
        return ()
    }
    func orderChocoMilk()->()?{
        // 재고가 없으면 닐 리턴
        guard let drink = drinkInventory.popChocoMilk() else {
            return nil
        }
        orderedDrinks.append(drink)
        return ()
    }
    func orderCoke()->()?{
        // 재고가 없으면 닐 리턴
        guard let drink = drinkInventory.popCokeInventory() else {
            return nil
        }
        orderedDrinks.append(drink)
        return ()
    }
    func orderZeroCalorieCoke()->()?{
        // 재고가 없으면 닐 리턴
        guard let drink = drinkInventory.popZeroCalorieCokeInventory() else {
            return nil
        }
        orderedDrinks.append(drink)
        return ()
    }
    func orderHotTopCoffee()->()?{
        // 재고가 없으면 닐 리턴
        guard let drink = drinkInventory.popHotTopCoffeeInventory() else {
            return nil
        }
        orderedDrinks.append(drink)
        return ()
    }
    func orderEnergyDrink()->()?{
        // 재고가 없으면 닐 리턴
        guard let drink = drinkInventory.popEnergyDrinkInventory() else {
            return nil
        }
        orderedDrinks.append(drink)
        return ()
    }
    
    
    /// 재고 추가
    func addDrink(drink:Drink)->()?{
        return self.drinkInventory.addInventory(drink: drink)
    }
    
    /// 남아있는 모든 재고 확인
    func getAllInventory()->String{
        return drinkInventory.getTotalDrinkDetail()
    }
}

