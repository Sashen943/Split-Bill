//
//  Bill.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/09.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import Foundation

class Bill {

    // MARK: Attribute(s)

    var totalAmountBeforeTip: Float = 0
    var totalAmount: Float = 0
    var tipPercent: Float = 0
    var numberOfPeople = 1
    var location = "No location"

    // MARK: Constructor

    init(){}

    // MARK: Method(s)

    func getTotalAmountDuePerPerson() -> String {
        let amount = totalAmount
        let people = NumberConverter.convertIntToFloat(numberAsInt: numberOfPeople)
        let split = amount/people
        let currency = Currency.currency()
        return  "\(currency)\(split.roundCurrency())"
    }

}
