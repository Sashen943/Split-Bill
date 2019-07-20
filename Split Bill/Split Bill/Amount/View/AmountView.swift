//
//  AmountView.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/09.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import Foundation

protocol AmountView {
    func congigureTitle(title: String)
    func configureInstructionTitle(instructionTitle: String)
    func configureCurrencyLabel(currency: String)
    func configureNextButton(buttonTitle: String)
    func configureErrorMessage(message: String)
    func showErrorMessage()
    func hideErrorMessage()
    func performNavigation(bill: Bill)
}
