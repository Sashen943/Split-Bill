//
//  NumberManipulator.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/15.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import Foundation

extension Float {
    func roundCurrency() -> String {
        return String(format: "%.2f", self)
    }
}

extension String {
    
    func currencyInputFormatting() -> String {
        
        var number: NSNumber!
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currencyAccounting
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.currencyDecimalSeparator = "."
        formatter.currencySymbol = ""
        formatter.usesGroupingSeparator = false
        
        var amountWithPrefix = self
        
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix,
                                                          options: NSRegularExpression.MatchingOptions(rawValue: 0),
                                                          range: NSMakeRange(0, self.count),
                                                          withTemplate: "")
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        guard number != 0 as NSNumber else {
            return ""
        }
        return formatter.string(from: number)!
    }
}
