//
//  ForgotPasswordVC.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 03/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var txtemail: UITextField!
    
    
    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var btnsubmit: UILabel!
    
    @IBOutlet weak var emaiView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnback.roundButton()
        self.loginView.roundView()
        self.emaiView.viewconfig(radius: 10)
        
        AppLanguage.updateTextFieldsDirection([txtemail])
        txtemail.placeholder = "Email".localized
        btnback.setTitle("Back".localized, for: .normal)
        btnsubmit.text  = "Submit".localized
    }
    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    
    @IBAction func submitAction(_ sender: UIButton) {
        if cehckData() {
            
            forgotApi()
        }
    }
    
    func cehckData() -> Bool {
        if txtemail.text == "" {
            Zalert.showAlert(title: "Alert".localized, message: "Please Enter Email".localized, messagetype: 0)
            return false
        } else if txtemail.text!.isValidEmail == false{
            Zalert.showAlert(title: "Alert".localized, message: "Please Enter Valid Email".localized, messagetype: 0)
            return false
        }
        return true
    }
    
    func forgotApi(){
        let dic : [String:Any] = ["email":txtemail.text!]
        ShareData.showProgress()
        userhandler.forgotpassword(parms: dic, Success: {response in
            ShareData.hideProgress()
            if response.success! {
                
                self.alertMessage(message: response.message!, completionHandler: {
                    self.moveOnreset()
                })
            }else {
                ShareData.hideProgress()
                Zalert.showAlert(title: "Alert".localized, message: response.message!, messagetype: 0)
            }
        }, Failure:{ error in
            ShareData.hideProgress()
            Zalert.showAlert(title: "Alert".localized, message: error.message, messagetype: 0)
        
        })
    }
    
    func moveOnreset(){
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "ResetPasswordVC") as? ResetPasswordVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}
