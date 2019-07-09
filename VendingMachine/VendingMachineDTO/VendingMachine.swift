//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation
class VendingMachine: ProductSoldable {
    private var balance : Int
    
    private var shoppingHistory: [Drink]
    /// 메뉴번호별 음료수 리스트 1~6
    private (set) var drinkStockTable: [Int : DrinkItemList]
    /// drinkName과 메뉴번호 매핑한 딕셔너리
    private (set) lazy var drinkNameMenuTable : [String : Int] = self.buildMenuTable(self.drinkStockTable)
    
    var vendingMachineState : StateTransitionable?
    lazy var initialState : StateTransitionable = self.initializeInitialState()
    lazy var readyState : StateTransitionable = self.initializeReadyState()
    lazy var chargeMoneyState: StateTransitionable = self.initializeChargeMoneyState()
    lazy var soldState: StateTransitionable = self.initializeSoldState()
    lazy var soldoutState: StateTransitionable = self.initializeSoldoutState()
    lazy var notEnoughMoneyState: StateTransitionable = self.initializeNotEnoughMoneyState()

    init(drinkStockTable : [Int : DrinkItemList]){
        self.drinkStockTable = drinkStockTable
        balance = 0
        shoppingHistory = [Drink]()
        
        vendingMachineState = InitialState.init(machine: self)
    }

    ///자판기 금액을 원하는 금액만큼 올리는 메소드
    func chargeBalance(_ money: Int){
        if money <= 0 {
            print("판매 금액은 양수여야 합니다." )
        }
        self.balance += money
    }

    ///전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func showDrinkStockTable() -> [Int : DrinkItemList]{
        return self.drinkStockTable
    }
    
    ///시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func showShoppingHistory() -> [Drink] {
        return self.shoppingHistory
    }
    ///유통기한이 지난 재고만 리턴하는 메소드
    func showValidateOverDrink() -> [Drink]{
        var totalNotForSaleList = [Drink]()
        for offsetElementpair in self.drinkStockTable.enumerated() {
            let drinkStockList = offsetElementpair.element.value
            let stockNotForSaleList = drinkStockList.notForSaleList
            totalNotForSaleList += stockNotForSaleList
        }
        return totalNotForSaleList
    }
    ///따뜻한 음료만 리턴하는 메소드
    ///동일한 상품 카테고리 물건이라도 서로 다른 온도를 지닐 수 있음을 가정
    func showHotterDrinkList() -> [Drink]{
        var hotDrinkList = [Drink]()
        for offsetElementpair in self.drinkStockTable.enumerated() {
            let drinkStockList = offsetElementpair.element.value
            hotDrinkList += drinkStockList.getHotDrinkList()
        }
        return hotDrinkList
    }
    
    /// 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func showBuyableDrinkList() -> [BeverageInfo]{
        var buyableDrinkList = [BeverageInfo]()
        for offsetElementpair in self.drinkStockTable.enumerated() {
            let drinkStockList = offsetElementpair.element.value
            if drinkStockList.isAvailable(self.balance) {
                buyableDrinkList.append(drinkStockList.drinkStockInfo)
            }
        }
        return buyableDrinkList
    }
    
    ///특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    ///만약 해당 상품인스턴스가 기존 재고에 없다면 넘버링을 새로하여 메뉴테이블과 재고테이블에 추가한다.
    func addDrinkStock(_ drink: Drink){
        
        if let value = self.drinkNameMenuTable[drink.drinkName] {
            let drinkList = self.drinkStockTable[value]!
            
        }else{
            let nextNumber = self.drinkNameMenuTable.count+1
            
        }
    }
    
    ///잔액을 확인하는 메소드
    func informCurrentBalance() -> Int {
        return self.balance
    }
    ///자판기의 현재상태 전이 메서드
    func changeState(_ nextState: StateTransitionable){
        self.vendingMachineState = nextState
    }
    
    ///음료수를 구매(판매)하는 메소드
    func sellProduct(productId: Int) -> Drink? {
        guard let productList = drinkStockTable[productId] else {
            return nil
        }
        let soldProduct = productList.removeFirstElement()
        drinkStockTable.updateValue(productList, forKey: productId)
        return soldProduct
    }
    
    func showCurrentBalanceInfo() {
        print("현재 투입한 금액이 \(balance)원입니다.", separator: "")
        print("다음과 같은 음료가 있습니다.")
        displayDrinkStockInfo()
    }
    
    func displayDrinkStockInfo(){
        let sortedMenutable = self.drinkStockTable.sorted{$0.key < $1.key }
        sortedMenutable.forEach{
            (element) in
            print(element.value.description)
        }
    }
    
    /// lazy properties initializer
    func initializeNotEnoughMoneyState() -> StateTransitionable {
        return NotEnoughMoneyState(machine: self)
    }
    func initializeSoldoutState() -> StateTransitionable {
        return SoldoutState(machine: self)
    }
    func initializeSoldState() -> StateTransitionable{
        return SoldState(machine: self)
    }
    func initializeReadyState() -> StateTransitionable {
        return ReadyState(machine: self)
    }
    func initializeChargeMoneyState() -> StateTransitionable {
        return ChargeMoneyState(machine: self)
    }
    func initializeInitialState() -> StateTransitionable {
        return InitialState(machine: self)
    }
    ///lazy property initialize
    private func buildMenuTable(_ drinkStockTable: [Int: DrinkItemList]) -> [String: Int]{
        var menuTempTable = [String: Int]()
        for (key, element) in drinkStockTable.enumerated(){
            menuTempTable.updateValue(key, forKey: "\(element.value.drinkName))")
        }
        return menuTempTable
    }
}
