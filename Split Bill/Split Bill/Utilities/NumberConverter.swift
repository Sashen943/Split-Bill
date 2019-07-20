//
//  NumberConverter.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/09.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import Foundation

public class NumberConverter {
    
    public static func convertStringToFloat(numberAsString: String) -> Float {
        let numberFormatter = NumberFormatter()
        let number = numberFormatter.number(from: numberAsString)
        guard let numberFloatValue = number?.floatValue else { return 0.0 }
        return numberFloatValue
    }
    
    public static func convertDoubleToInt(numberAsDouble: Double) -> Int {
        return Int(numberAsDouble)
    }
    
    public static func convertIntToFloat(numberAsInt: Int) -> Float {
        return Float(numberAsInt)
    }
}
