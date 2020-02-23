//
//  HistoryRepositoryImplementation.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2020/01/04.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

class HistoryRepositoryImplementation: HistoryRepository {
    
    let databaseManager = DatabaseManager()
    
    func fetchBills() -> [BillObject]? {
        if let result = databaseManager.fetchFromDatabase(BillObject.self) {
            var bills = [BillObject]()
            for bill in result {
                bills.append(bill)
            }
            return bills
        } else {
            return nil
        }
    }
}


