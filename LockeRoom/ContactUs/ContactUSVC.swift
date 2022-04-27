//
//  ContactUSVC.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 03/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit

class ContactUSVC: UIViewController {

    @IBOutlet weak var lblquery: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Lokeroom"
        lblquery.text = "If you have any question or queries contact us at ".localized
         addBackButton()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
