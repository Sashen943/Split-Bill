//
//  BreakdownView.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/17.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import UIKit

class BreakdownView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var totalBillTitleLabel: UILabel!
    @IBOutlet weak var totalBillValueLabel: UILabel!
    @IBOutlet weak var tipTitleLabel: UILabel!
    @IBOutlet weak var tipValueLabel: UILabel!
    @IBOutlet weak var totalBillIncludingTipTitleLabel: UILabel!
    @IBOutlet weak var totalBillIncludingTipValueLabel: UILabel!
    @IBOutlet weak var splitTitleLabel: UILabel!
    @IBOutlet weak var splitValueLabel: UILabel!
    @IBOutlet weak var eachPersonPaysTitleLabel: UILabel!
    @IBOutlet weak var eachPersonPaysValueLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         self.configureCardView(view: self)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureCardView(view: self)
    }
    
    private func configureCardView(view: UIView){
        let nib = UINib(nibName: "BreakdownView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    func configureTitles(totalBillTitle: String, tipTitle: String,
                         totalBillIncludingTipTitle: String, splitTitle: String,
                         eachPersonPaysTitle: String) {
        totalBillTitleLabel.text = totalBillTitle
        tipTitleLabel.text = tipTitle
        totalBillIncludingTipTitleLabel.text = totalBillIncludingTipTitle
        splitTitleLabel.text = splitTitle
        eachPersonPaysTitleLabel.text = eachPersonPaysTitle
        
    }
    
    func configureValues(totalBillValue: String,
                         tipValue: String,
                         totalBillIncludingTipValue: String,
                         splitValue: String,
                         eachPersonPaysValue: String) {
        totalBillValueLabel.text = totalBillValue
        tipValueLabel.text = tipValue
        totalBillIncludingTipValueLabel.text = totalBillIncludingTipValue
        splitValueLabel.text = splitValue
        eachPersonPaysValueLabel.text = eachPersonPaysValue
        
    }
    
    
}
