//
//  ShowCase.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 2. 5..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct ShowCase: BeverageDisplayStand {
    var description: String {
        var result = "<< 선택한 음료 옵션의 검색결과 >> \n"
        self.itemsForDisplay.forEach { shelf in
            result += "\(shelf.value[0].type) | \(shelf.value[0].getPrice())원 : \(shelf.value.count)개 \n"
        }
        return result
    }
    private(set) var itemsForDisplay = [ObjectIdentifier: [Beverage]]()

    init(itemsForDisplay: [ObjectIdentifier: [Beverage]]) {
        self.itemsForDisplay = itemsForDisplay
    }
}
