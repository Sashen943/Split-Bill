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
    func configureHistoryBarButton(buttonTitle: String)
    func showErrorMessage()
    func hideErrorMessage()
    func navigateToSplitScreen(bill: Bill)
    func navigateToHistoryScreen()
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func displayLocationNotFoundPopUp()
}
