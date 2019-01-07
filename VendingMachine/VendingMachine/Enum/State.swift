//
//  State.swift
//  VendingMachine
//
//  Created by 윤동민 on 04/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum State : String {
    case success = ""
    case negative = "양의 단위로 넣으세요"
    case notEnough = "음료의 재고가 없습니다."
    case fail = "금액이 부족합니다."
    case notExist = "메뉴에 있는 음료를 선택하시오"
}
