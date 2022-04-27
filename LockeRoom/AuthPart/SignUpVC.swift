//
//  SignUpVC.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 01/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit

class SignUpVC: BaseVC {

    @IBOutlet weak var btnlogin: UIButton!
    
    @IBOutlet weak var lblalready: UILabel!
    @IBOutlet weak var lblsignup: UILabel!
    @IBOutlet weak var clubView: UIView!
    
    @IBOutlet weak var EmailView: UIView!
    
    
    @IBOutlet weak var counteryView: UIView!
    
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var cityView: UIView!
    
    
    @IBOutlet weak var confirmView: UIView!
    
    @IBOutlet weak var singUpView: UIView!
    
    
    @IBOutlet weak var txtcountry: UITextField!
    
    @IBOutlet weak var txtclubname: UITextField!
    
    @IBOutlet weak var txtemail: UITextField!
    
    @IBOutlet weak var txtcity: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    
    
    @IBOutlet weak var txtcnforimpassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       addBackButton() 
       setUpSignup()
    }
    
    func setUpSignup() {
        
        AppLanguage.updateTextFieldsDirection([txtpassword,txtemail,txtcity,txtcountry,txtclubname,txtcnforimpassword])
        lblsignup.text = "Sign Up".localized
        lblalready.text = "Already have an account ?".localized
        btnlogin.setTitle("Login".localized, for: .normal)
        
        txtcnforimpassword.placeholder = "Confirm Password".localized
        txtclubname.placeholder = "Club Name ".localized
        txtcountry.placeholder = "Country".localized
        txtcity.placeholder = "City".localized
        txtemail.placeholder = "Email".localized
        txtpassword.placeholder = "Password".localized
        
        clubView.viewconfig(radius: 10)
           
           EmailView.viewconfig(radius: 10)
           
           
            counteryView.viewconfig(radius: 10)
           
            passwordView.viewconfig(radius: 10)
           
        cityView.viewconfig(radius: 10)
           
           
           confirmView.viewconfig(radius: 10)
           
           singUpView.roundView()
        
        
    }
    @IBAction func loginaction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func signUpAction(_ sender: Any) {
        if isCheck() {
            resgiter()
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
               }else if(txtcnforimpassword.text! == ""){
                Zalert.showAlert(title: "Alert".localized, message: "Please Enter The Confirem Password".localized, messagetype: 0)
                   return false
               }else if(txtcity.text! == ""){
                Zalert.showAlert(title: "Alert".localized, message: "Please Enter The  City Name".localized, messagetype: 0)
                   return false
               }
               else if(txtcountry.text! == ""){
                Zalert.showAlert(title: "Alert".localized, message: "Please Enter The Country Name".localized, messagetype: 0)
                   return false
               }
            
               return true
           }
    
    func resgiter(){
        ShareData.showProgress()
        let dic : [String: Any] = ["club_name":txtclubname.text!,
                                   "email":txtemail.text!,
                                   "password":txtpassword.text!,
                                "country":txtcountry.text!,"password_confirmation":txtcnforimpassword.text!,
                                   "role_id":"5d7b757e7cda7522c4e50a34",
                                   "city":txtcity.text! ]
        userhandler.Register(parms: dic, Success: {(successReponse) in
            ShareData.hideProgress()
            if successReponse.success! {
                
                ShareData.shareInfo.userData(User: successReponse.data!)
                
                ShareData.shareInfo.password = self.txtpassword.text
                ShareData.shareInfo.email = self.txtemail.text
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
