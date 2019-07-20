//
//  ResultView.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/14.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import Foundation

protocol ResultView: class {
    func configureTitle(title: String)
    func configureEachPersonPaysLabel(labelTitle: String)
    func configureSpiltAmountLabel(labelTitle: String)
    func configureTotalAmountLabel(labelTitle: String)
    func configureTipLabel(labelTitle: String)
    func configureDoneButton(buttonTitle: String)
    func configureDetailsButton(buttonTitle: String, action: Selector, target: Any)
    func configureHideDetailsButton(buttonTitle: String, action: Selector, target: Any)
    func configureBreakdownViewTitles(totalBillTitle: String,
                                      tipTitle: String,
                                      totalBillIncludingTipTitle: String,
                                      splitTitle: String,
                                      eachPersonPaysTitle: String)
    func configureBreakdownViewValues(totalBillValue: String,
                                      tipValue: String,
                                      totalBillIncludingTipValue: String,
                                      splitValue: String,
                                      eachPersonPaysValue: String)
    func showDetails()
    func hideDetails()
}
