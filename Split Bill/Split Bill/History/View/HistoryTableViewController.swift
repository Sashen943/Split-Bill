//
//  HistoryTableViewController.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2020/01/04.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController, HistoryView {
    
    @IBOutlet var billTableView: UITableView!
    
    private lazy var historyViewModel = HistoryViewModel(historyView: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyViewModel.fetchSavedBills()
        billTableView.dataSource = self
        billTableView.delegate = self
        self.view.backgroundColor = .black
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyViewModel.numberOfBills
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bill", for: indexPath) as! HistoryTableViewCell
        let index = indexPath.row
        cell.splitLabel?.text = historyViewModel.displayableSplitLabelText(atIndex: index)
        cell.dateLabel?.text = historyViewModel.displayableDateLabelText(atIndex: index)
        cell.timeLabel?.text = historyViewModel.displayableTimeLabelText(atIndex: index)
        cell.locationLabel?.text = historyViewModel.displayableLocationLabelText(atIndex: index)
        cell.amountLabel?.text = historyViewModel.displayableAmountLabel(atIndex: index)
        return cell
    }
    
}
