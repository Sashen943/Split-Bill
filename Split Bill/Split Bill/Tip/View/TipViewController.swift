//
//  TipViewController.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/09.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    public var bill: Bill?
    
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var tipValueLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var viewModel: TipViewModel?
    
    let step: Float = 5
    var tipValue: Float = 10.0
    var totalValue: Float = 0
    var valueBeforeTip: Float = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewModel()
    }
    
    func setUpViewModel() {
        if let bill = self.bill {
            viewModel = TipViewModel(bill: bill, view: self)
            viewModel?.configureUI()
            viewModel?.updateTipPercentage(percentage: round(tipSlider.value / step) * step)
        }
    }
    
    @IBAction func tipSliderValueChanged(_ sender: UISlider) {
        let tip = round(sender.value / step) * step
        viewModel?.updateTipPercentage(percentage: tip)
    }
    
    @IBAction func calculateBillTapped(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! ResultViewController
        viewController.bill = viewModel?.bill
    }

}

extension TipViewController: TipView {

    func configureTitle(title: String) {
        self.title = title
    }
    
    func configureInstruction(instruction: String) {
        self.instructionLabel.text = instruction
    }
    
    func configureNextButton(buttonTitle: String) {
        nextButton.setTitle(buttonTitle, for: .normal)
    }
    
    func updateTotalBillAmount(totalBillAmount: String) {
        self.totalValueLabel.text = totalBillAmount
    }
    
    func updateTipPercentage(percentage: String) {
        self.tipValueLabel.text = percentage
    }
    
}
