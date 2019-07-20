//
//  CardView.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/16.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import UIKit

class CardView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureCardView(view: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureCardView(view: self)
    }
    
    private func configureCardView(view: UIView){
        view.layer.cornerRadius = 4
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 2
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.backgroundColor = UIColor.white
    }

}
