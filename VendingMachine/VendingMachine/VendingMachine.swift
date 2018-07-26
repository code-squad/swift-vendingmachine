//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 7. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class VendingMachine {
    /// init
    init(){
        self.mainInventory.append(self.chocoMilkInventory)
        self.mainInventory.append(self.lowSugarChocoMilkInventory)
        self.mainInventory.append(self.cokeInventory)
        self.mainInventory.append(self.zeroCalorieCokeInventory)
        self.mainInventory.append(self.hotTopCoffeeInventory)
        self.mainInventory.append(self.energyDrinkInventory)
    }
    
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
    
    /// 전체 재고를 배열로 담는 변수
    var mainInventory : [[Drink]] = []
    
    
}

