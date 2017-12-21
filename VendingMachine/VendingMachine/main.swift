//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let machine = VendingMachine()
    while let activatedMode = InputView.prompt(machine) {
        while let userArgs = activatedMode.prompt() {
            guard let result = activatedMode.perform(userArgs) else { break }
            OutputView.showResult(result)
            continue
        }
    }
}

main()
