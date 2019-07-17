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
    private var earning: Int = 0
    private (set) var fromState : StateType
    private var shoppingHistory: [Drink]
    /// 메뉴번호별 음료수 리스트 1~6
    private (set) var drinkStockTable: [Int : DrinkItemList]
    /// drinkName과 메뉴번호 매핑한 딕셔너리
    private (set) lazy var drinkNameMenuTable : [String : Int] = buildMenuTable(drinkStockTable)
    
    var vendingMachineState : StateTransitionable?
    
    private (set) lazy var modeSelectState: StateTransitionable = initializeModeSelectState()
    /// user mode state
    private (set) lazy var initialState : StateTransitionable = initializeInitialState()
    private (set) lazy var readyState : StateTransitionable = initializeReadyState()
    private (set) lazy var chargeMoneyState: StateTransitionable = initializeChargeMoneyState()
    private (set) lazy var sellingState: StateTransitionable = initializeSellingState()
    /// admin mode state
    private (set) lazy var adminInitialState : StateTransitionable = initializeAdminInitialState()
    private (set) lazy var adminReadyState : StateTransitionable =  initializeAdminReadyState()
    private (set) lazy var addStockState : StateTransitionable = initializeAddStockState()
    private (set) lazy var removeStockState : StateTransitionable = initializeRemoveStockState()



    init(drinkStockTable : [Int : DrinkItemList] = [Int : DrinkItemList]()){
        self.drinkStockTable = drinkStockTable
        balance = 0
        shoppingHistory = [Drink]()
        fromState = StateType.modeSelect
        vendingMachineState = ModeSelectState.init(machine: self)//InitialState.init(machine: self)
    }

    ///자판기 금액을 원하는 금액만큼 올리는 메소드
    func chargeBalance(_ money: Int){
        balance += money
    }

    ///전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func showDrinkStockTable() -> [Int : DrinkItemList]{
        return drinkStockTable
    }
    
    ///시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func showShoppingHistory() -> [Drink] {
        return shoppingHistory
    }
    
    ///유통기한이 지난 재고만 리턴하는 메소드
    func showValidateOverDrink() -> [Drink]{
        var totalNotForSaleList = [Drink]()
        for offsetElementpair in drinkStockTable.enumerated() {
            let drinkStockList = offsetElementpair.element.value
            let stockNotForSaleList = drinkStockList.makeNotForSaleList()
            totalNotForSaleList += stockNotForSaleList
        }
        return totalNotForSaleList
    }
    ///따뜻한 음료만 리턴하는 메소드
    ///동일한 상품 카테고리 물건이라도 서로 다른 온도를 지닐 수 있음을 가정
    func showHotterDrinkList() -> [Drink]{
        var hotDrinkList = [Drink]()
        for offsetElementpair in drinkStockTable.enumerated() {
            let drinkStockList = offsetElementpair.element.value
            hotDrinkList += drinkStockList.getHotDrinkList()
        }
        return hotDrinkList
    }
    
    /// 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func showBuyableDrinkList() -> [BeverageInfo]{
        var buyableDrinkList = [BeverageInfo]()
        for offsetElementpair in drinkStockTable.enumerated() {
            let drinkStockList = offsetElementpair.element.value
            if drinkStockList.isAvailable(balance) {
                buyableDrinkList.append(drinkStockList.drinkStockInfo)
            }
        }
        return buyableDrinkList
    }
    
    func selectProduct(productId: Int) throws -> Drink{
        guard let productList = drinkStockTable[productId] else{
            throw VendingMachineError.notFoundDrinkIdError
        }
        if productList.drinkStockList.isEmpty {
            return productList.drinkItemInfo
        }
        return productList.drinkStockList[0]
    }
    ///특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    ///만약 해당 상품인스턴스가 기존 재고에 없다면 넘버링을 새로하여 메뉴테이블과 재고테이블에 추가한다.
    func addDrinkStock(_ drink: Drink, quantity: Int) throws {
        if let menuNumber = drinkNameMenuTable[drink.name] {
            try addStockDefault(drink: drink, number: menuNumber, quantity: quantity)
        }else{
            let newMenuNumber = drinkNameMenuTable.count+1
            updateMenuTable(nextIndex: newMenuNumber, name: drink.name)
            updateDrinkStockTable(nextIndex: newMenuNumber, drinkElement: drink)
            try addStockDefault(drink: drink, number: newMenuNumber, quantity: quantity-1)
        }
    }
    
    func removeDrinkStock(number: Int, quantity: Int) throws -> (Drink, actualRemoved: Int){
        if let itemList = drinkStockTable[number]{
            let removeItemInfo = itemList.removeElement(quantity: quantity)
            return removeItemInfo
        }
        throw VendingMachineError.notFoundDrinkIdError
    }
    
   
    
    private func addStockDefault(drink: Drink, number : Int, quantity: Int) throws {
        let drinkList = drinkStockTable[number]!
        try drinkList.addItem(drink, quantity: quantity)
    }
    
   

    private func updateDrinkStockTable (nextIndex newMenuNumber: Int, drinkElement : Drink){
        let drinkItemListInfoSet = makeNewDrinkItemInfo(drinkElement)
        let newDrinkItemList = DrinkItemList(drinkList: drinkItemListInfoSet.drinkList, stockInfo: drinkItemListInfoSet.info)
        drinkStockTable.updateValue(newDrinkItemList, forKey: newMenuNumber)
    }
    
    private func updateMenuTable(nextIndex newMenuNumber: Int, name newDrinkName : String) {
        drinkNameMenuTable.updateValue(newMenuNumber, forKey: newDrinkName)
    }
    
    private func makeNewDrinkItemInfo(_ drink: Drink) -> (drinkList: [Drink], info: BeverageInfo){
        let newBeverageInfo = BeverageInfo.init(drink: drink)
        var stockList = [Drink]()
        stockList.append(drink)
        return (stockList, newBeverageInfo)
    }
    
    ///잔액을 확인하는 메소드
    func informCurrentBalance() -> Int {
        return balance
    }
    
    ///자판기의 현재상태 전이 메서드
    func changeState(_ nextState: StateTransitionable, from : StateType){
        vendingMachineState = nextState
        fromState = from
    }
    
    ///음료수를 구매(판매)하는 메소드
    func sellProduct(productId: Int) throws -> Drink {
        guard let productList = drinkStockTable[productId] else {
            throw VendingMachineError.notFoundDrinkIdError
        }
        if productList.isAvailable(balance){  /// 판매 가능하면 업데이트
            productList.makeNotForSaleList()
            if productList.isEmpty{
                throw VendingMachineError.outOfStockError
            }
            let soldProduct = productList.removeFirstElement()
            let price = productList.drinkStockInfo.price
            minusProductPriceFromBalance(price)
            updateEarning(price)
            drinkStockTable.updateValue(productList, forKey: productId)
            shoppingHistory.append(soldProduct)
            return soldProduct
        }
        throw VendingMachineError.notEnoughMoneyError
    }
    private func updateEarning(_ money: Int){
        earning += money
    }
    private func minusProductPriceFromBalance(_ money: Int) {
        balance -= money
    }
    
    func showCurrentBalanceInfo(printFormat: (_ balance: Int) -> Void){
        printFormat(balance)
    }
    
    func showCurrentEarningInfo(printFormat: (_ earning: Int) -> Void){
        printFormat(earning)
    }
    ///initialState
    func displayDrinkMenuList(printFormat: ([(key: Int, value: DrinkItemList)]) -> Void ) {
        let sortedMenutable = drinkStockTable.sorted{$0.key < $1.key }
        printFormat(sortedMenutable)
    }
    
    /// lazy properties initializer
    func initializeSellingState() -> StateTransitionable{
        return SellingState(machine: self)
    }
    func initializeReadyState() -> StateTransitionable {
        return ReadyState(machine: self)
    }
    func initializeChargeMoneyState() -> StateTransitionable {
        return ChargingMoneyState(machine: self)
    }
    func initializeInitialState() -> StateTransitionable {
        return InitialState(machine: self)
    }
    func initializeModeSelectState() -> StateTransitionable{
        return ModeSelectState(machine: self)
    }
    func initializeAdminInitialState() -> StateTransitionable {
        return AdminInitialState.init(machine: self)
    }
    func initializeAdminReadyState() -> StateTransitionable {
        return AdminReadyState.init(machine: self)
    }
    func initializeAddStockState() -> StateTransitionable {
        return AddStockState.init(machine: self)
    }
    func initializeRemoveStockState() -> StateTransitionable {
        return RemoveStockState.init(machine: self)
    }
    
    ///lazy property initialize
    private func buildMenuTable(_ drinkStockTable: [Int: DrinkItemList]) -> [String: Int]{
        var menuTempTable = [String: Int]()
        for element in drinkStockTable{
            menuTempTable.updateValue(element.key, forKey: "\(element.value.drinkName)")
        }
        return menuTempTable
    }
}
