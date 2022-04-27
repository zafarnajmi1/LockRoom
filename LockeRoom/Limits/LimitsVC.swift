//
//  LimitsVC.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 02/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit

class LimitsVC: UIViewController {
    @IBOutlet weak var btntag: UIButton!
    @IBOutlet weak var lbllimit: UILabel!
    
    @IBOutlet weak var lblmin: UILabel!
    @IBOutlet weak var txtmax: UITextField!
    @IBOutlet weak var txtmin: UITextField!
    @IBOutlet weak var minView: UIView!
    
    @IBOutlet weak var limitView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lockeroom"
        setLimit()
        addBackButton()
        btntag.roundButton()
    }
    
    func setLimit() {
        
        txtmin.text = ShareData.shareInfo.min ?? ""
        txtmax.text = ShareData.shareInfo.limit ?? ""
        btntag.setTitle("Save Tags".localized, for: .normal)
        lblmin.text = "Minimum".localized
        lbllimit.text = "Maximum".localized
        
        
        self.limitView.layer.cornerRadius = 5
        self.limitView.layer.borderWidth = 1
        self.limitView.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        self.minView.layer.cornerRadius = 5
        self.minView.layer.borderWidth = 1
        self.minView.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    @IBAction func tagsAction(_ sender: UIButton) {
        if isCheck() {
            TagsSave()
        }
    }

     func isCheck() -> Bool{
    //
        
            if(self.txtmin.text == ""){
                Zalert.showAlert(title: "Alert".localized, message: "Please Enter Min Limit of The Tags".localized, messagetype: 0)
                return false
            }else if(self.txtmax.text == ""){
                Zalert.showAlert(title: "Alert".localized, message: "Please Enter The Max Limit Of The Tags".localized, messagetype: 0)
                return false
            }
        
            
            return true
        }
    
    
    func TagsSave(){
        ShareData.showProgress()
        let dic : [String: Any] = ["min_tag":txtmin.text!, "max_tag":txtmax.text!]
        userhandler.tagsSave(parms: dic, Success: {(successReponse) in
            ShareData.hideProgress()
            if successReponse.success! {
                Zalert.showAlert(title: "Alert".localized, message: successReponse.message!, messagetype: 1)
                ShareData.shareInfo.min = self.txtmin.text!
                ShareData.shareInfo.limit = self.txtmax.text!
            } else {
                ShareData.hideProgress()
                Zalert.showAlert(title: "Alert".localized, message: successReponse.message!, messagetype: 0)
            }
            
        }, Failure: {(error) in
            ShareData.hideProgress()
            Zalert.showAlert(title: "Alert".localized, message: error.message, messagetype: 0)
            
        })
    }
}
