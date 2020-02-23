//
//  HistoryTableViewCell.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2020/01/05.
//  Copyright © 2020 Sashen Pillay. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    // MARK: Outlet(s)
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timelinePointView: UIView!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createTimelineDotOnCell()
    }
    
    // MARK: Function(s)
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func createTimelineDotOnCell() {
        timelinePointView.layer.cornerRadius = timelinePointView.frame.size.width/2
        timelinePointView.clipsToBounds = true
        timelinePointView.layer.borderWidth = 0.0
        timelinePointView.backgroundColor = .white
    }
    
}
