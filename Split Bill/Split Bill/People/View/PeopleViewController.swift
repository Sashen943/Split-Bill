//
//  PeopleViewController.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/09.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    
    public var bill: Bill?
  
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var spiltTextField: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var nextButton: UIButton!

    var viewModel: PeopleViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewModel()
    }

    func setUpViewModel() {
        if let bill = self.bill {
            viewModel = PeopleViewModel(view: self, bill: bill)
            viewModel?.updateBumberOfPeople(with: splitStepper?.value ?? 1)
            viewModel?.configureUI()
        }
    }

    @IBAction func didTapStepper(_ sender: Any) {
        viewModel?.updateBumberOfPeople(with: splitStepper?.value ?? 1)
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "tip", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! TipViewController
        viewController.bill = viewModel?.bill
    }
    
}

extension PeopleViewController: PeopleView {
    
    func configureTitle(title: String) {
        self.title = title
    }

    func configureInstruction(instruction: String) {
        self.titleLabel.text = instruction
    }
    
    func configureSpiltLabel(value: String) {
        self.spiltTextField.text = value
    }
    
    func configureNextButton(buttonTitle: String) {
        self.nextButton.setTitle(buttonTitle, for: .normal)
    }
    
    func updateNumberOfPeople(numberOfPeople: String) {
        spiltTextField.text = numberOfPeople
    }
    
    
}
