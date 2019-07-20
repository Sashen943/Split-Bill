//
//  ResultViewController.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/14.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var eachPersonPaysLabel: UILabel!
    @IBOutlet weak var amountSplitLabel: UILabel!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var summaryCardView: CardView!
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var hideDetailsButton: UIButton!
    @IBOutlet weak var breakdownView: BreakdownView!
    
    var bill: Bill?
    var viewModel: ResultViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideLeftNavigationItem()
        setUpViewModel()
    }
    private func setUpViewModel() {
        if let bill = self.bill {
            viewModel = ResultViewModel(bill: bill, view: self)
            viewModel?.configureUI()
        }
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func hideLeftNavigationItem() {
        self.navigationItem.leftBarButtonItem = nil
    }

}

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
    
    func configureDetailsButton(buttonTitle: String, action: Selector, target: Any) {
        detailsButton.titleLabel?.text = buttonTitle
        detailsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func configureHideDetailsButton(buttonTitle: String, action: Selector, target: Any) {
        hideDetailsButton.titleLabel?.text = buttonTitle
        hideDetailsButton.addTarget(target, action: action, for: .touchUpInside)
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
    
    func showDetails() {
        breakdownView.isHidden = false
        detailsButton.isHidden = true
        hideDetailsButton.isHidden = false
    }
    
    func hideDetails() {
        breakdownView.isHidden = true
        hideDetailsButton.isHidden = true
        detailsButton.isHidden = false
    }

}
