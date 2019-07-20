//
//  AmountViewController.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/09.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import UIKit

class AmountViewController: UIViewController {
    
    var amount: Float?
    private lazy var amountViewModel = AmountViewModel(amountView: self)

    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        amountViewModel.configureUI()
        amountTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
        amountViewModel.nextButtonTap(amount: amountTextField.text ?? "")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! PeopleViewController
        viewController.bill = amountViewModel.bill
    }
    
   @objc func textChanged(_ textField: UITextField) {
        
        if let amountString = textField.text?.currencyInputFormatting() {
            textField.text = amountString
        }
    }

}

extension AmountViewController: AmountView {
    
    func configureCurrencyLabel(currency: String) {
        currencyLabel.text = currency
    }
    
    func congigureTitle(title: String) {
        self.title = title
    }
    
    func configureInstructionTitle(instructionTitle: String) {
        self.instructionLabel.text = instructionTitle
    }
    
    func configureNextButton(buttonTitle: String) {
        nextButton.setTitle(buttonTitle, for: .normal)
    }
    
    func showErrorMessage() {
        errorLabel.isHidden = false
    }
    
    func hideErrorMessage() {
        errorLabel.isHidden = true
    }
    
    func configureErrorMessage(message: String) {
        errorLabel.text = message
        errorLabel.isHidden = true
    }
    
    func performNavigation(bill: Bill) {
        performSegue(withIdentifier: "people", sender: self)
    }
    
    
}
