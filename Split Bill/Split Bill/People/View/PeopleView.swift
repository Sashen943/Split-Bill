//
//  PeopleView.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/12.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import Foundation

protocol PeopleView {
    func configureTitle(title: String)
    func configureInstruction(instruction: String)
    func configureNextButton(buttonTitle: String)
    func updateNumberOfPeople(numberOfPeople: String)
}
