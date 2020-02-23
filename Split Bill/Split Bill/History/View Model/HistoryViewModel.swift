//
//  HistoryViewModel.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2020/01/04.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

class HistoryViewModel {
    
    private var historyView: HistoryView
    private var repository: HistoryRepository = HistoryRepositoryImplementation()
    private var bills: [BillObject]?
    
    var numberOfBills: Int {
        return bills?.count ?? 0
    }
    
    init(historyView: HistoryView) {
        self.historyView = historyView
    }
    
    func fetchSavedBills() {
        self.bills = self.repository.fetchBills()?.reversed()
    }
    
    func getTotalAmountOfBill(atIndex index: Int) -> String {
        return bills?[index].totalAmount ?? ""
    }
    
    func getDateOfBill(atIndex index: Int) -> String {
        return bills?[index].date ?? ""
    }
    
    // MARK: Split label
    
    func displayableSplitLabelText(atIndex index: Int) -> String {
        let bill = self.bills?[index]
        let split = bill?.split ?? ""
        let amount = bill?.amountDuePerPerson ?? ""
        let labelText = createPrimaryLabelTextFromSplit(split: split, amount: amount)
        return labelText
    }
    
    // MARK: Date Label
    
    func displayableDateLabelText(atIndex index: Int) -> String {
        let bill = self.bills?[index]
        let dateTimeStamp = bill?.date ?? ""
        let date = splitDate(dateTimeStamp: dateTimeStamp)
        return "\(date)"
    }
    
    // MARK: Time Label
    
    func displayableTimeLabelText(atIndex index: Int) -> String {
        let bill = self.bills?[index]
        let dateTimeStamp = bill?.date ?? ""
        let time = splitTime(dateTimeStamp: dateTimeStamp)
        return "\(time)"
    }
    
    // MARK: Location Label
    
    func displayableLocationLabelText(atIndex index: Int) -> String {
        let location = bills?[index].location
        return location ?? "No locationb"
    }
    
    // MARK: Amount Label
    
    func displayableAmountLabel(atIndex index: Int) -> String {
        let bill = self.bills?[index]
        let total = bill?.totalAmount?.currencyInputFormatting()
        let amount = "\(Currency.currency())\(total ?? "")"
        return amount
    }
    
    // MARK: Text Manipulation

    private func createPrimaryLabelTextFromSplit(split: String, amount: String) -> String {
        if split == "1" {
            return "1 person paid \(amount)"
        } else {
            return "\(split) people paid \(amount) each"
        }
    }
    
    private func splitDate(dateTimeStamp: String) -> String {
        let split = dateTimeStamp.split(separator: " ")
        let date = "\(split[0])"
        return date
    }
    
    private func splitTime(dateTimeStamp: String) -> String {
        let split = dateTimeStamp.split(separator: " ")
        let time = "\(split[1])"
        return time
    }
    
}
