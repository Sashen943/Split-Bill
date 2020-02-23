//
//  HistoryRepository.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2020/01/04.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import Foundation

protocol HistoryRepository {
    func fetchBills() -> [BillObject]?
}
