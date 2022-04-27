//
//  HistoryDayCell.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 01/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit

class HistoryDayCell: UITableViewCell {

    @IBOutlet weak var lblscnnas: UILabel!
    @IBOutlet weak var lblamount: UILabel!
    @IBOutlet weak var lblscans: UILabel!
    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        mainView.layer.cornerRadius =  10
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = #colorLiteral(red: 0.4965696335, green: 0.1912667751, blue: 0.8802448511, alpha: 1)
        lblscnnas.text = "Scans".localized
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
