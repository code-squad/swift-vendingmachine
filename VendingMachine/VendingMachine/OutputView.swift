//
//  OutputView.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {

    func show(_ text: CustomStringConvertible) {
        print(text.description)
    }

    /*
    쇼케이스(선택한 옵션만 임시로 표시해주는 개념)가
    모두 [ObjectIdentifier:[Beverage]] 형태라
    items 파라미터를 받아서 딕셔너리를 readable하게 출력
    */
    func showcase(items: [ObjectIdentifier:[Beverage]]) -> String {
        var result = ""
        items.forEach { set in
            result += "\(set.value[0].type) (\(set.value.count)개) | "
        }
        return result
    }


}
