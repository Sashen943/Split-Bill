//
//  AmountViewModel.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/09.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import Foundation

class AmountViewModel {
    
    let titleLabel = "Amount"
    let instructionTitle = "Bill amount"
    let buttonTitle = "NEXT"
    let currency = Currency.currency()
    let errorMessage = "The amount entered is invalid.\nMake sure to include cents for example \(Currency.currency())12 is \(Currency.currency())12.00"
    
    var bill: Bill = Bill()
    var amountView: AmountView?
    
    init(amountView: AmountView) {
        self.amountView = amountView
    }
    
    func configureUI() {
        self.amountView?.congigureTitle(title: titleLabel)
        self.amountView?.configureInstructionTitle(instructionTitle: instructionTitle)
        self.amountView?.configureNextButton(buttonTitle: buttonTitle)
        self.amountView?.configureErrorMessage(message: errorMessage)
        self.amountView?.configureCurrencyLabel(currency: currency)
    }
    
     func nextButtonTap(amount: String) {
        amountView?.hideErrorMessage()
        if let amountToSet = Float(amount) {
            setBillAmount(amount: amountToSet)
            amountView?.performNavigation(bill: bill)
        }
    }

    private func setBillAmount(amount: Float) {
        bill.totalAmountBeforeTip = amount
    }
    
}
