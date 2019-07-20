//
//  PeopleViewModel.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/09.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import Foundation

class PeopleViewModel {
    
    let title = "Split number"
    let instruction = "Ways to split"
    let nextButtonTitle = "NEXT"
    let startOverButtonTitle = "Start over"
    
    var bill: Bill
    var view: PeopleView
    
    init(view: PeopleView, bill: Bill) {
        self.bill = bill
        self.view = view
    }
    
    func configureUI() {
        view.configureTitle(title: title)
        view.configureInstruction(instruction: instruction)
        view.configureNextButton(buttonTitle: nextButtonTitle)
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
