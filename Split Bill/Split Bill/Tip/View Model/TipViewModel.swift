//
//  TipViewModel.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/12.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import Foundation

class TipViewModel {
    
    let title = "Tip"
    let instruction = "What are we tipping?"
    let nextButtonTitle = "CALCULATE BILL"
    let totalValueOfBill = "Total:"
    
    var bill: Bill
    var view: TipView
    
    init(bill: Bill, view: TipView) {
        self.bill = bill
        self.view = view
    }
    
    func configureUI() {
        view.configureTitle(title: title)
        view.configureNextButton(buttonTitle: nextButtonTitle)
        view.configureInstruction(instruction: instruction)
    }
    
    func updateTipPercentage(percentage: Float) {
        bill.tipPercent = percentage
        view.updateTipPercentage(percentage: "\(Int(percentage))%")
        view.updateTotalBillAmount(totalBillAmount: "\(totalValueOfBill)  \(Currency.currency())\(calculateTotalValue(tip: percentage)) ")
    }
    
    private func  calculateTotalValue(tip: Float) -> String {
        bill.totalAmount = bill.totalAmountBeforeTip + (bill.totalAmountBeforeTip * (tip/100))
        return  bill.totalAmount.roundCurrency()
    }
    
}
