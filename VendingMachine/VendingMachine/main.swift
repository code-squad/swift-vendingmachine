//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main(){
    // 자판기 생성
    var vendingMachine = VendingMachine()
    
    // 음료수 생성
    guard
        let lowSugarChocoMilk  = ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "저과당초코우유", manufacturingDate: "20171009", lowFat: true, lowSugar: true)
        ,
        let hot6 = EnergyDrink(
            barnd: "핫식스", size: 200, price: 1000, name: "핫식스", manufacturingDate: "20171012", zeroCaffeine: false),
        let coke = Coke(barnd: "팹시", size: 350, price: 2000, name: "콜라", manufacturingDate: "20171005", usingPET: false, zeroCalorie: false),
        let topCoffee = TopCoffee(barnd: "맥심", size: 400, price: 3000, name: "TOP아메리카노", manufacturingDate: "20171010", hot: false, zeroSugar: false),
        let chocoMilk  = ChocoMilk(barnd: "서울우유", size: 200, price: 1000, name: "그냥초코우유", manufacturingDate: "20171009", lowFat: true, lowSugar: false),
        let zeroCalorieCoke = Coke(barnd: "팹시", size: 350, price: 2000, name: "다이어트콜라", manufacturingDate: "20171005", usingPET: false, zeroCalorie: true)
        else {
            return ()
    }
    // 음료수 추가
    vendingMachine.addDrink(drink: lowSugarChocoMilk)
    vendingMachine.addDrink(drink: lowSugarChocoMilk)
    vendingMachine.addDrink(drink: hot6)
    vendingMachine.addDrink(drink: hot6)
    vendingMachine.addDrink(drink: coke)
    vendingMachine.addDrink(drink: coke)
    vendingMachine.addDrink(drink: zeroCalorieCoke)
    vendingMachine.addDrink(drink: zeroCalorieCoke)
    vendingMachine.addDrink(drink: topCoffee)
    vendingMachine.addDrink(drink: topCoffee)
    vendingMachine.addDrink(drink: chocoMilk)
    vendingMachine.addDrink(drink: chocoMilk)
    
    /// 인풋뷰 선언
    let inputView = InputView()
    /// 아웃풋뷰 선언
    let outputView = OutputView()
    /// 메인메뉴 출력
    print(outputView.mainMenu())
    /// 첫번째 스텝 진행 순서
    func mainMenu()->String{
        print(outputView.returnMoney(money: vendingMachine.getMoney()))
        print(outputView.returnGettableDrink(drinks: vendingMachine.getAllInventory()))
        let firstMenu = inputView.firstMenu()
        return firstMenu
    }
    /// 돈 추가를 선택시 진행순서
    func insertMoneyStep(){
        if let money = inputView.insertMoney() {
            vendingMachine.plusMoney(money: money)
        }
        else {
            print(outputView.wrongMoney())
        }
    }
    /// 음료선택시 재고가 남아있는지 체크후 해당 음료의 정보를 가저온다
    func checkInventoryCount(dirnkNumber:Int)->InventoryDetail?{
        // 메뉴번호-1 이 실제 배열임
        guard let drinkDetail : InventoryDetail = vendingMachine.getAllInventory()[dirnkNumber-1] else {
            print(outputView.notEnoughDrink())
            return nil
        }
        return drinkDetail
    }
    /// 원하는 수량이 >0 인지 체크
    func getOrderCount(drinkName:String)->Int?{
        guard let orderCount = inputView.howMany(drink: drinkName) else {
            print(outputView.notNumeric())
            return nil
        }
        return orderCount
    }
    /// 원하는 수량이 재고와 맞는지 체크
    func checkEnoughDrinkCount(drinkCount:Int,orderCount:Int)->Bool{
        guard drinkCount >= orderCount else {
            print(outputView.notEnoughDrink())
            return false
        }
        return true
    }
    
    /// 인벤토리->주문내역 으로 음료 이동
    func moveDrink(drinkNumber:Int)->()?{
        // 이전 단계에서 체크가 끝난 음료를 이동시킨다
        switch drinkNumber {
        case 1 : vendingMachine.orderLowSugarChocoMilk()
        case 2 : vendingMachine.orderChocoMilk()
        case 3 : vendingMachine.orderCoke()
        case 4 : vendingMachine.orderZeroCalorieCoke()
        case 5 : vendingMachine.orderHotTopCoffee()
        case 6 : vendingMachine.orderEnergyDrink()
        default : return nil
        }
        return ()
    }
    
    /// 금액 차감 단계
    func calculateMoney(drinkPrice:Int)->()?{
        if vendingMachine.getMoney() >= drinkPrice {
            // 금액 차감
            vendingMachine.minusMoney(money: drinkPrice)
        } // 금액부족
        else {
            print(outputView.notEnoughMoney())
            return nil
        }
        return ()
    }
    
    /// 음료 선택후 구매 진행과정
    func buyingDrink(drinkNumber:Int){
        /// 구매가 가능한지 체크한다
        guard let drinkDetail = checkInventoryCount(dirnkNumber: drinkNumber) // 구매하려는 음료가 잔고가 있는지
            , let orderCount = getOrderCount(drinkName: drinkDetail.getDrinkName()) // 원하는 수량이 >0 인지
            , checkEnoughDrinkCount(drinkCount: drinkDetail.getDrinkCount(), orderCount: orderCount) == true
            // 잔고 >= 원하는 수량 인지
            else {
                // 하나라도 잘못되면 단계 취소
                return ()
        }
        // 돈 계산
        if calculateMoney(drinkPrice: drinkDetail.getDrinkPrice()*orderCount) == nil {
            return ()
        }
        
        // 인벤토리->주문내역 으로 음료 이동
        if moveDrink(drinkNumber: drinkNumber) == nil  {
            print(outputView.notEnoughDrink())
        }
        
        // 성공메세지 출력
        print(outputView.buyingSuccessMessage(dirnkName: drinkDetail.getDrinkName(), drinkCount: orderCount, drinkPirce: drinkDetail.getDrinkPrice()*orderCount))
    }
    
    /// 음료 선택 시 진행 순서
    func selectDirnk(){
        // 음료 번호를 선택한다. 1~Checker.maxDrinuNumber 사이면 통과
        if let selectedDrinkNumber = Checker.isRightDrinkNumber(inputView.whichDrink()) {
            // 음료 구매가 진행된다
            buyingDrink(drinkNumber: selectedDrinkNumber)
        } // 잘못된 선택일 경우
        else {
            print(outputView.wrongMenu())
        }
    }
    
    while true {        
        let firstMenu = mainMenu()
        switch firstMenu {
        case "1" : insertMoneyStep()
        case "2" : selectDirnk()
        case "q" :
            print(outputView.quitMessage())
            return ()
        default : print(outputView.wrongMenu())
        }
    }
}


main()

