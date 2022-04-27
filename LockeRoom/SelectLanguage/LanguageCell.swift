//
//  LanguageCell.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 03/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit

class LanguageCell: UITableViewCell {

    @IBOutlet weak var lbllang: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
//English,Arabic,Francais,Italiano
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
