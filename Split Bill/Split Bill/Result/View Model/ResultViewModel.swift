//
//  ResultViewModel.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/14.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import Foundation

class ResultViewModel {
    
    let title = "Summary"
    let eachPersonPaysTitle = "Each person pays"
    let tipTitle = "Including a tip of"
    let totalAmountTitle = "Total amount of bill"
    let doneButtonTitle = "DONE"
    
    let detailsButtonTitle = "Details"
    let hideDetailsButtonTitle = "Hide details"
    
    let breakDownTotalBillTitle = "Total Bill"
    let breakDownTipTitle = "Tip (%@ of %@)"
    let breakDownTotalBillIncludingTipTitle = "Total Bill including Tip"
    let breakDownSplitTitle = "Split"
    let breakDownEachPersonPaysTitle = "Each person pays ( %@ ÷ %@ )"
    
    let currency = Currency.currency()
    
    var bill: Bill
    weak var view: ResultView?
    
    var tipWithTitle: String {
        get {
            let percent = Int(bill.tipPercent)
            return "\(tipTitle) \(percent)%"
        }
    }
    
    var totalAmountWithTitle: String {
        get {
            return "\(totalAmountTitle) \(currency)\(bill.totalAmount.roundCurrency())"
        }
    }
    
    var totalAmountWithoutTip: String {
        get {
            return "\(currency)\(bill.totalAmountBeforeTip.roundCurrency())"
        }
    }
    
    var totalAmountWithTip: String {
        get {
            return "\(currency)\(bill.totalAmount.roundCurrency())"
        }
    }
    
    var tip: String {
        get {
            let percent = Int(bill.tipPercent)
            return "\(percent)%"
        }
    }
    
    var valueOfTip: String {
        get {
            let tipValue = (bill.totalAmount - bill.totalAmountBeforeTip)
            return "\(currency)\(tipValue.roundCurrency())"
        }
    }

    
    var split: String {
        return "\(bill.numberOfPeople)"
    }
    
    init(bill: Bill, view: ResultView) {
        self.bill = bill
        self.view = view
    }
    
    func configureUI() {
        view?.configureTitle(title: title)
        view?.configureEachPersonPaysLabel(labelTitle: eachPersonPaysTitle)
        view?.configureSpiltAmountLabel(labelTitle: calculateAmountThatEachPersonPays())
        view?.configureTipLabel(labelTitle: tipWithTitle)
        view?.configureTotalAmountLabel(labelTitle: totalAmountWithTitle)
        view?.configureDoneButton(buttonTitle: doneButtonTitle)
        view?.configureDetailsButton(buttonTitle: detailsButtonTitle, action: #selector(showDetails), target: self)
        view?.configureHideDetailsButton(buttonTitle: hideDetailsButtonTitle, action: #selector(hideDetails), target: self)
        configureBreakdownTitles()
        configureBreakdownValues()
        view?.hideDetails()
    }
    
    private func configureBreakdownTitles() {
        let tipTitle = String(format: breakDownTipTitle, tip, totalAmountWithoutTip)
        let eachPersonPaysTitle = String.init(format: breakDownEachPersonPaysTitle, totalAmountWithTip, split)
        view?.configureBreakdownViewTitles(totalBillTitle: breakDownTotalBillTitle,
                                          tipTitle: tipTitle,
                                          totalBillIncludingTipTitle: breakDownTotalBillIncludingTipTitle,
                                          splitTitle: breakDownSplitTitle,
                                          eachPersonPaysTitle: eachPersonPaysTitle)
    }
    
    private func configureBreakdownValues() {
        let billWithoutTip = totalAmountWithoutTip
        let tip = valueOfTip
        let billWithTip = totalAmountWithTip
        let eachPersonPays = calculateAmountThatEachPersonPays()
        view?.configureBreakdownViewValues(totalBillValue: billWithoutTip,
                                           tipValue: tip,
                                           totalBillIncludingTipValue: billWithTip,
                                           splitValue: split,
                                           eachPersonPaysValue: eachPersonPays)
    }
    
    @objc func hideDetails() {
        view?.hideDetails()
    }
    
    @objc func showDetails() {
        view?.showDetails()
    }
    
    private func calculateAmountThatEachPersonPays() -> String {
        let amount = bill.totalAmount
        let people = NumberConverter.convertIntToFloat(numberAsInt: bill.numberOfPeople)
        let split = amount/people
        return  "\(currency)\(split.roundCurrency())"
    }

}
