//
//  TermsConditionsVC.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 03/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit

class TermsConditionsVC: UIViewController {

    @IBOutlet weak var lblcondition: UILabel!
    @IBOutlet weak var lblterms: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addBackButton()
        self.title = "Lockeroom"
        lblcondition.text = "Terms & Conditions".localized
        termsCall()
        
    }
    

    
    func termsCall() {
        ShareData.showProgress()
        userhandler.gettermscondition(Success: {success in
            ShareData.hideProgress()
            if success.success!{
                self.lblterms.text = success.data?.collection?.content?.html2String
            }else {
                ShareData.hideProgress()
                Zalert.showAlert(title: "Alert", message: success.message!, messagetype: 0)
            }
            
        }, Failure: {error in
            ShareData.hideProgress()
            Zalert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    

}
