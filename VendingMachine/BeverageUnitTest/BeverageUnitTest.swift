import XCTest

class BeverageUnitTest: XCTestCase {

    func testExpirationDate() {
        let top = TOPCoffee(dateOfManufacture: Date("20190121")!)
        XCTAssert(top.isExpired(targetDate:  Date("20201202")!))
        XCTAssertFalse(top.isExpired(targetDate: Date("20190212")!))
    }
    
    func testHotDrink() {
        
        let cantata = CantataCoffee(dateOfManufacture: Date())
        XCTAssert(cantata.isHot)
        
        let top = TOPCoffee(dateOfManufacture: Date())
        XCTAssertFalse(top.isHot)
    }
    
    func testLowCalorieSoftDrink() {
        let cola = Cola(dateOfManufacture: Date())
        XCTAssertFalse(cola.isLowCalorie)
    }
}
