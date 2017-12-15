//
//  StockCounter.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

protocol Counter {
    func count<ContentType, ContentName>(_ contents: [ContentType]) -> [ContentName:Int]
}

struct StockCounter: Counter {
    typealias ContentType = Beverage
    typealias ContentName = VendingMachine.Menu
    static let counter = StockCounter()

    func count<ContentType, ContentName>(_ contents: [ContentType]) -> [ContentName:VendingMachine.Stock] {
        // Beverage 배열을 구체적인 타입에 따라 개수 기록.
        return [:]
    }

}

extension Dictionary where Value == Int {
    // 딕셔너리 값이 Int인 경우, 결과값을 누적해서 업데이트 가능.
    mutating func updateInventory(forKey key: Key) {
        // 해당 키의 기존 값이 있는 경우.
        if let prevNumberCount = self[key] {
            // 기존 값에 +1 한 값 저장.
            self.updateValue(prevNumberCount+1, forKey: key)
        }else {
            // 첫 값인 경우, 해당 키의 값에 1 저장.
            self.updateValue(1, forKey: key)
        }
    }
}
