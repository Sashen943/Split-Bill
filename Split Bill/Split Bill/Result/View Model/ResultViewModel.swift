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
    let breakDownTipTitle = "Tip %@"
    let breakDownTotalBillIncludingTipTitle = "Total bill + tip"
    let breakDownSplitTitle = "Split"
    let breakDownEachPersonPaysTitle = "Each person pays"
    let currency = Currency.currency()
    
    var bill: Bill
    private lazy var repository: ResultRepository = ResultRepositoryImplementation()
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
    
    var location: String = ""
    
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
        configureBreakdownTitles()
        configureBreakdownValues()
    }
    
    func saveBill() {
        repository.saveBill(self.bill)
    }
    
    private func configureBreakdownTitles() {
        let tipTitle = String(format: breakDownTipTitle, tip)
        let eachPersonPaysTitle = String.init(format: breakDownEachPersonPaysTitle)
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
    
    private func calculateAmountThatEachPersonPays() -> String {
        let amount = bill.totalAmount
        let people = NumberConverter.convertIntToFloat(numberAsInt: bill.numberOfPeople)
        let split = amount/people
        return  "\(currency)\(split.roundCurrency())"
    }
    
    
}
