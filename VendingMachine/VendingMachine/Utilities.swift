//
//  Extensions.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

extension Dictionary where Value == Int {
    // 딕셔너리 값이 Int인 경우, 결과값을 누적해서 업데이트 가능.
    mutating func update(forKey key: Key) {
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

// 클래스 iterator
class ClassIteratorOf<Type>: IteratorProtocol {
    typealias Element = Type
    private let elements: [Element]
    private var nextIndex: Int
    init(_ elements: [Element]) {
        self.nextIndex = 0
        self.elements = elements
    }

    func next() -> Element? {
        defer { self.nextIndex += 1 }
        guard self.nextIndex < self.elements.count else { return nil }
        return self.elements[self.nextIndex]
    }

}
