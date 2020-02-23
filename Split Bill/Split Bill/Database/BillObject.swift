//
//  File.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2020/01/04.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation
import RealmSwift


class BillObject: Object {
    
    @objc dynamic var totalAmount: String?
    @objc dynamic var split: String?
    @objc dynamic var tipPercentage: String?
    @objc dynamic var amountDuePerPerson: String?
    @objc dynamic var date: String?
    @objc dynamic var location: String?
    
    init (bill: Bill) {
        self.totalAmount = "\(bill.totalAmount.roundCurrency())"
        self.split = "\(bill.numberOfPeople)"
        self.date = "\(Date())"
        self.amountDuePerPerson = "\(bill.getTotalAmountDuePerPerson())"
        self.tipPercentage = "\(bill.tipPercent)"
        self.location = "\(bill.location)"
    }
    
    required init() {}
    
}
