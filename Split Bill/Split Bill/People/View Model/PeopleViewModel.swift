//
//  PeopleViewModel.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/09.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import Foundation

class PeopleViewModel {
    
    // MARK: Constant(s)
    
    let Title = "Split number"
    let Instruction = "How many ways are we splitting this?"
    let NextButtonTitle = "NEXT"
    
    // MARK: Attributes
    
    var bill: Bill
    var view: PeopleView
    
    // MARK: Constructor
    
    init(view: PeopleView, bill: Bill) {
        self.bill = bill
        self.view = view
    }
    
    // MARK: Method(s)
    
    func configureUI() {
        view.configureTitle(title: Title)
        view.configureInstruction(instruction: Instruction)
        view.configureNextButton(buttonTitle: NextButtonTitle)
    }
    
    func updateBumberOfPeople(with numberOfPeople: Int) {
        bill.numberOfPeople = numberOfPeople
        view.updateNumberOfPeople(numberOfPeople: "\(numberOfPeople)")
    }
    
    func updateBumberOfPeople(with numberOfPeople: Double) {
        let value = NumberConverter.convertDoubleToInt(numberAsDouble: numberOfPeople)
        bill.numberOfPeople = value
        view.updateNumberOfPeople(numberOfPeople: "\(value)")
    }
    
}
