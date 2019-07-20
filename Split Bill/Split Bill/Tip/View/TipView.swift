//
//  TipView.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/12.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import Foundation

protocol TipView {
    func configureTitle(title: String)
    func configureInstruction(instruction: String)
    func updateTotalBillAmount(totalBillAmount: String)
    func configureNextButton(buttonTitle: String)
    func updateTipPercentage(percentage: String)
}
