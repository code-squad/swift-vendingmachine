//
//  InputView.swift
//  VendingMachine
//
//  Created by 이동영 on 16/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol InputView {
    func showMenu()
    func fetchInput() -> String
}
extension InputView {
    func fetchInput() -> String {
        showMenu()
        return readLine() ?? ""
    }
}
