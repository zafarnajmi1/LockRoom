//
//  SettingCell.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 25/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {

    @IBOutlet weak var lblname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
