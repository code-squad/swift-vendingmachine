//
//  ModeActivation.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

typealias Menudetails = (mode: Controller.Mode, money: Int, menu: [Beverage], inventory: [Beverage: Int])
protocol ModeActivation {
    func makePreGameMenu() -> Menudetails
    func action(actionType: Action, detail: Int) throws
}
