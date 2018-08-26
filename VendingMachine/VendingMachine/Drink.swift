//
//  Drink.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 7. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

/// 날자 입출력 포맷. 전역변수로 선언
fileprivate let dateFormat = "yyyyMMdd"

extension Date {
    func toString ()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"ko_KR")
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}

extension String{
    func toDate()->Date?{
         let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"ko_KR")
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: self)
    }
}

/// 음료객체의 모든 값을 저장,전달하는 객체
class DrinkInformation {
    fileprivate let brand : String
    fileprivate let size : Int
    fileprivate let price : Int
    fileprivate let name : String
    fileprivate let manufacturingDate : Date
    let drinkType : DrinkInventory.DrinkType
    
    init(drink:Drink){
        self.brand = drink.brand
        self.size = drink.size
        self.price = drink.price
        self.name = drink.name
        self.manufacturingDate = drink.manufacturingDate
        self.drinkType = drink.drinkType
    }
}

/// 모든 음료수의 수퍼클래스
class Drink : CustomStringConvertible {
    fileprivate let brand : String
    fileprivate let size : Int
    fileprivate let price : Int
    fileprivate let name : String
    fileprivate let manufacturingDate : Date
    let drinkType : DrinkInventory.DrinkType
    
    init?(barnd:String, size:Int,price:Int, name:String, manufacturingDate:String,drinkType:DrinkInventory.DrinkType) {
        self.brand = barnd
        self.size = size
        self.price = price
        self.name = name
        self.drinkType = drinkType
        guard let date = manufacturingDate.toDate() else {
            return nil
        }
        self.manufacturingDate = date
    }
    init(drinkInformation:DrinkInformation){
        self.brand = drinkInformation.brand
        self.size = drinkInformation.size
        self.price = drinkInformation.price
        self.name = drinkInformation.name
        self.manufacturingDate = drinkInformation.manufacturingDate
        self.drinkType = drinkInformation.drinkType
    }
    
    var description : String  {
        // 생성자에서 dateFormat 옵셔널 검사가 완료 됬으므로 여기선 강제 래핑
        return ("\(String(describing: type(of: self))) - \(brand), \(size)ml, \(price)원, \(brand), \(manufacturingDate.toString())")
    }
}

/// 우유 정보를 담는 객체
class MilkInformation : DrinkInformation {
    fileprivate let lowFat : Bool
    
    init(milk:Milk){
        self.lowFat = milk.lowFat
        super.init(drink: milk)
    }
}

/// 우유 클래스
class Milk : Drink {
    fileprivate let lowFat : Bool
    
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, lowFat: Bool,drinkType:DrinkInventory.DrinkType) {
        self.lowFat = lowFat
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate,drinkType:drinkType)
    }
    init(milkInformation:MilkInformation){
        self.lowFat = milkInformation.lowFat
        super.init(drinkInformation: milkInformation)
    }
}

/// 초코우유 정보를 담는 객체
class ChocoMilkInformation : MilkInformation {
    fileprivate let lowSugar : Bool
    
    init(chocoMilk:ChocoMilk){
        self.lowSugar = chocoMilk.lowSugar
        super.init(milk: chocoMilk)
    }
}

class ChocoMilk : Milk {
    fileprivate let lowSugar : Bool
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, lowFat: Bool, lowSugar:Bool) {
        self.lowSugar = lowSugar
        let drinkType = lowSugar ? DrinkInventory.DrinkType.lowSugarChocoMilk : DrinkInventory.DrinkType.chocoMilk
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate, lowFat: lowFat,drinkType:drinkType)
    }
    init(chocoMilkInformation:ChocoMilkInformation){
        self.lowSugar = chocoMilkInformation.lowSugar
        super.init(milkInformation: chocoMilkInformation)
    }
}

/// 탄산음료 정보를 담는 객체
class SodaInformation : DrinkInformation {
    fileprivate let usingPET : Bool
    
    init(soda:Soda){
        self.usingPET = soda.usingPET
        super.init(drink: soda)
    }
}
/// 탄산음료 클래스
class Soda : Drink {
    fileprivate let usingPET : Bool
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, usingPET: Bool,drinkType:DrinkInventory.DrinkType) {
        self.usingPET = usingPET
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate,drinkType:drinkType)
    }
    init(sodaInformation:SodaInformation){
        self.usingPET = sodaInformation.usingPET
        super.init(drinkInformation: sodaInformation)
    }
}

/// 콜라 정보를 담는 객체
class CokeInformation : SodaInformation {
    fileprivate let zeroCalorie : Bool
    
    init(coke:Coke){
        self.zeroCalorie = coke.zeroCalorie
        super.init(soda: coke)
    }
}
class Coke : Soda {
    fileprivate let zeroCalorie : Bool
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, usingPET: Bool,zeroCalorie:Bool) {
        self.zeroCalorie = zeroCalorie
        let drinkType = zeroCalorie ? DrinkInventory.DrinkType.zeroCalorieCoke : DrinkInventory.DrinkType.coke
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate, usingPET: usingPET,drinkType:drinkType)
    }
    init(cokeInformation:CokeInformation){
        self.zeroCalorie = cokeInformation.zeroCalorie
        super.init(sodaInformation: cokeInformation)
    }
}

/// 커피 정보를 담는 객체
class CoffeeInformation : DrinkInformation {
    fileprivate let hot : Bool
    
    init(coffee:Coffee){
        self.hot = coffee.hot
        super.init(drink: coffee)
    }
}
/// 커피 클래스
class Coffee : Drink{
    fileprivate let hot : Bool
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, hot: Bool,drinkType:DrinkInventory.DrinkType) {
        self.hot = hot
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate,drinkType:drinkType)
    }
    init(coffeeInformation:CoffeeInformation){
        self.hot = coffeeInformation.hot
        super.init(drinkInformation: coffeeInformation)
    }
}

/// TOP커피 정보를 담는 객체
class TopCoffeeInformation : CoffeeInformation {
    fileprivate let zeroSugar : Bool
    
    init(topCoffee:TopCoffee){
        self.zeroSugar = topCoffee.zeroSugar
        super.init(coffee: topCoffee)
    }
}
class TopCoffee : Coffee {
    fileprivate let zeroSugar : Bool
    init?(brand: String, size: Int, price: Int, name: String, manufacturingDate: String,hot: Bool, zeroSugar: Bool) {
        self.zeroSugar = zeroSugar
        let drinkType = zeroSugar ? DrinkInventory.DrinkType.zeroCalorieCoke : DrinkInventory.DrinkType.none
        super.init(barnd: brand, size: size, price: price, name: name, manufacturingDate: manufacturingDate,hot: hot,drinkType:drinkType)
    }
    init(topCoffeeInformation:TopCoffeeInformation){
        self.zeroSugar = topCoffeeInformation.zeroSugar
        super.init(coffeeInformation: topCoffeeInformation)
    }
}

/// 에너지드링크 정보를 담는 객체
class EnergyDrinkInformation : DrinkInformation {
    fileprivate let zeroCaffeine : Bool
    
    init(energyDrink:EnergyDrink){
        self.zeroCaffeine = energyDrink.zeroCaffeine
        super.init(drink: energyDrink)
    }
}
/// 에너지 드링크 클래스
class EnergyDrink : Drink {
    fileprivate let zeroCaffeine : Bool
    init?(barnd: String, size: Int, price: Int, name: String, manufacturingDate: String, zeroCaffeine: Bool) {
        self.zeroCaffeine = zeroCaffeine
        let drinkType = zeroCaffeine ? DrinkInventory.DrinkType.energyDrink : DrinkInventory.DrinkType.none
        super.init(barnd: barnd, size: size, price: price, name: name, manufacturingDate: manufacturingDate,drinkType:drinkType)
    }
    func duplicateSelf()->EnergyDrink?{
        return EnergyDrink(barnd: self.brand, size: self.size, price: self.price, name: self.name, manufacturingDate: self.manufacturingDate.toString(), zeroCaffeine:self.zeroCaffeine)
    }
    init(energyDrinkInformation:EnergyDrinkInformation){
        self.zeroCaffeine = energyDrinkInformation.zeroCaffeine
        super.init(drinkInformation: energyDrinkInformation)
    }
}


/// 재고정보를 담당할 구조체. 음료의 정보를 받아서 이름,가격,개수,음료타입
struct StoredDrinkDetail {
    let drinkName : String
    let drinkPrice : Int
    var drinkCount : Int
    let drinkType : DrinkInventory.DrinkType
    
    init(drink:Drink,drinkCount: Int){
        self.drinkName = drink.name
        self.drinkPrice = drink.price
        self.drinkCount = drinkCount
        self.drinkType = drink.drinkType
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
