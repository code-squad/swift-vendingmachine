//
//  InputView.swift
//  VendingMachine
//
//  Created by 윤지영 on 14/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct InputView {

    static func readMenu() -> (first: Int, second: Int)? {
        guard let input: String = readLine() else { return nil }
        let menuSelected = input.split(separator: " ")
        guard menuSelected.count == 2 else { return nil }
        guard let firstMenu = Int(menuSelected[0]) else { return nil }
        guard let secondMenu = Int(menuSelected[1]) else { return nil }
        return (firstMenu, secondMenu)
    }

}
