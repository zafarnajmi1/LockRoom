//
//  ResetPasswordVC.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 18/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit

class ResetPasswordVC: UIViewController {

    @IBOutlet weak var btnreset: UILabel!
    @IBOutlet weak var codeView: UIView!
    
    @IBOutlet weak var txtcode: UITextField!
    @IBOutlet weak var txtnewpass: UITextField!
    
    @IBOutlet weak var newpasswordView: UIView!
    
    @IBOutlet weak var oldpasswordView: UIView!
    
    @IBOutlet weak var txtconfirmpass: UITextField!
    
    
    @IBOutlet weak var resetView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        codeView.viewconfig(radius: 10)
        newpasswordView.viewconfig(radius: 10)
        oldpasswordView.viewconfig(radius: 10)
         resetView.roundView()
        
        AppLanguage.updateTextFieldsDirection([txtcode,txtnewpass,txtconfirmpass])
        txtconfirmpass.placeholder = "Confirm Password".localized
        txtnewpass.placeholder = "New Password ".localized
        txtcode.placeholder = "Verification Code".localized
        btnreset.text = "Reset Password".localized
    }
    

    
    @IBAction func resetAction(_ sender: UIButton) {
        if checkData() {
        resetApiCall()
        }
    }
    
    
    func checkData() ->Bool {
        if txtcode.text == "" {
            Zalert.showAlert(title: "Alert".localized, message: "Please Enter Code ".localized, messagetype: 0)
            return false
        } else if txtconfirmpass.text == "" {
            Zalert.showAlert(title: "Alert".localized, message: "Please Enter Confirm Password ".localized, messagetype: 0)
            return false
        }else if txtnewpass.text == "" {
            Zalert.showAlert(title: "Alert".localized, message: "Please Enter  Password ".localized, messagetype: 0)
            return false
        }
        return true
    }
    
    
    func resetApiCall(){
        let dic:[String:Any] = ["password":txtnewpass.text!,"password_confirmation":txtconfirmpass.text!,"verification_code":txtcode.text!]
        ShareData.showProgress()
        userhandler.resetPassword(parms: dic, Success: {response in
             ShareData.hideProgress()
            if response.success! {
                self.alertMessage(message: response.message!, completionHandler: {
                    self.moveOnlogin()
                })
            }else {
               ShareData.hideProgress()
            }
        }, Failure: {error in
            ShareData.hideProgress()
        })
    }
    
    
    func moveOnlogin(){
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}
