//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let machine = VendingMachine.sharedMachine
    machine.fullSupply()
    let inputView = InputView(machine)
    let outputView = OutputView(machine)
    while true {
        outputView.showResult(inputView.prompt())
    }
}

main()
