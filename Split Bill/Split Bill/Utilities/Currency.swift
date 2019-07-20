//
//  Currency.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/15.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import Foundation

public class Currency {
    public static func currency() -> String {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol ?? ""
        return currencySymbol
    }
}
