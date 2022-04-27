//
//  LoginVC.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 01/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit
import  Alamofire
class LoginVC: BaseVC {

    @IBOutlet weak var btnsignup: UIButton!
    @IBOutlet weak var lbldont: UILabel!
    @IBOutlet weak var lblsignin: UILabel!
    @IBOutlet weak var btnforgot: UIButton!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var emaiView: UIView!
    @IBOutlet weak var passwordView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpLogin()
        
    
    }
    
    func setUpLogin() {
        self.loginView.roundView()
        self.emaiView.viewconfig(radius: 10)
        passwordView.viewconfig(radius: 10)
        
        txtpassword.placeholder = "Password".localized
         txtemail.placeholder = "ID".localized
        lblsignin.text = "Login".localized
        lbldont.text = "Don't have an account ?".localized
        btnforgot.setTitle("Forgot Password?".localized, for: .normal)
        btnsignup.setTitle("Sign Up".localized, for: .normal)
        AppLanguage.updateTextFieldsDirection([txtemail,txtpassword])
        
    }
    @IBAction func forgotPassword(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    

    @IBAction func signupAction(_ sender: UIButton) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        if isCheck() {
            self.login()
        }
        
    }
    
    //ApiCall
    
        func isCheck() -> Bool{
       //
               if(self.txtemail.text == ""){
                Zalert.showAlert(title: "Alert".localized, message: "Please Enter The Email".localized, messagetype: 0)
                   return false
               }else if(self.txtpassword.text == ""){
                Zalert.showAlert(title: "Alert".localized, message: "Please Enter The Password".localized, messagetype: 0)
                   return false
               }else if(self.txtemail.text?.isValidEmail1 == false){
                Zalert.showAlert(title: "Alert".localized, message: "Please Enter  Valid Email".localized, messagetype: 0)
                   return false
               }else if((txtemail.text!.count > 128)){
                Zalert.showAlert(title: "Alert".localized, message: "Please Enter Valid  Email".localized, messagetype: 0)
                   return false
               }
               
               return true
           }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func login(){
        
        
        ShareData.showProgress()
        let dic : [String: Any] = ["email":txtemail.text!, "password":txtpassword.text!]
          userhandler.login(parms: dic, Success: {(successReponse) in
            ShareData.hideProgress()
            if successReponse.success! {
                ShareData.shareInfo.userData(User: successReponse.data!)
                ShareData.shareInfo.password = self.txtpassword.text
                ShareData.shareInfo.email = self.txtemail.text
                //Zalert.showAlert(title: "Alert", message: successReponse.message!, messagetype: 1)
                self.moveonHome()
            } else {
                ShareData.hideProgress()
                Zalert.showAlert(title: "Alert".localized, message: successReponse.message!.localized, messagetype: 0)
            }

        }, Failure: {(error) in
            ShareData.hideProgress()
            Zalert.showAlert(title: "Alert".localized, message: error.message.localized, messagetype: 0)

        })
    }
    
    
    func moveonHome() {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    
}
