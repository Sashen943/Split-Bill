//
//  ResultViewController.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/14.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import UIKit
import CoreLocation

class ResultViewController: UIViewController {
    
    // MARK: Outlet(s)
    
    @IBOutlet weak var eachPersonPaysLabel: UILabel!
    @IBOutlet weak var amountSplitLabel: UILabel!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var breakdownView: BreakdownView!
    
    // MARK: Attribute(s)
    
    var bill: Bill?
    var viewModel: ResultViewModel?
    
    // MARK: lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideLeftNavigationItem()
        self.setUpViewModel()
    }
    
    // MARK: Action(s)
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.viewModel?.saveBill()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func setUpViewModel() {
        if let bill = self.bill {
            viewModel = ResultViewModel(bill: bill, view: self)
            viewModel?.configureUI()
        }
    }
    
    // MARK: Method(s)
    
    private func hideLeftNavigationItem() {
        self.navigationItem.leftBarButtonItem = nil
    }
    
}

// MARK: ResultView Extension

extension ResultViewController: ResultView {
    
    func configureTitle(title: String) {
        self.title = title
    }
    func configureEachPersonPaysLabel(labelTitle: String) {
        eachPersonPaysLabel.text = labelTitle
    }
    
    func configureSpiltAmountLabel(labelTitle: String) {
        amountSplitLabel.text = labelTitle
    }
    
    func configureTotalAmountLabel(labelTitle: String) {
        totalBillLabel.text = labelTitle
    }
    
    func configureTipLabel(labelTitle: String) {
        tipLabel.text = labelTitle
    }
    
    func configureDoneButton(buttonTitle: String) {
        doneButton.setTitle(buttonTitle, for: .normal)
    }
    
    func configureBreakdownViewTitles(totalBillTitle: String, tipTitle: String, totalBillIncludingTipTitle: String, splitTitle: String, eachPersonPaysTitle: String) {
        breakdownView.configureTitles(totalBillTitle: totalBillTitle,
                                      tipTitle: tipTitle,
                                      totalBillIncludingTipTitle: totalBillIncludingTipTitle,
                                      splitTitle: splitTitle,
                                      eachPersonPaysTitle: eachPersonPaysTitle)
    }
    
    func configureBreakdownViewValues(totalBillValue: String, tipValue: String, totalBillIncludingTipValue: String, splitValue: String, eachPersonPaysValue: String) {
        breakdownView.configureValues(totalBillValue: totalBillValue,
                                      tipValue: tipValue,
                                      totalBillIncludingTipValue: totalBillIncludingTipValue,
                                      splitValue: splitValue,
                                      eachPersonPaysValue: eachPersonPaysValue)
    }
    
}
