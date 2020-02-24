//
//  ResultRepositoryImplementation.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2020/01/04.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

class ResultRepositoryImplementation: ResultRepository {
    
    // MARK: Attribute(s)
    let databaseManager = DatabaseManager()
    
    // MARK: Method(s)
    
    func saveBill(_ bill: Bill) {
        DispatchQueue.main.async {
            let billToSave = BillObject(bill: bill)
            self.databaseManager.saveToDatabase(object: billToSave)
        }
    }
    
}
