//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let printingData = InputView.makeIntances()
    OutputView(data: printingData).printResult()
}

main()

