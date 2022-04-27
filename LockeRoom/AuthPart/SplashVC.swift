//
//  ViewController.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 01/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit
import  Microblink
class SplashVC: BaseVC {
    


override func viewDidLoad() {
        super.viewDidLoad()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.moveOnLogin()
//        }
         self.checkLogin()
    }
/* if AppUserDefault.shared.saveLanguage == nil{
           moveOnLanguagVC()
       }else*/
    
    func checkLogin() {
        
        if ShareData.shareInfo.password != nil &&  ShareData.shareInfo.email != nil  {
            login()
        }else {
            moveOnLogin()
        }
    }
    
    
    
    
    func moveOnLogin(){
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    func moveOnLanguagVC(){
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "LanguagVC") as? LanguagVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    func login(){
        
        
        ShareData.showProgress()
        let dic : [String: Any] = ["email":ShareData.shareInfo.email ?? "", "password":ShareData.shareInfo.password ?? ""]
          userhandler.login(parms: dic, Success: {(successReponse) in
            ShareData.hideProgress()
            if successReponse.success! {
                ShareData.shareInfo.userData(User: successReponse.data!)
                //Zalert.showAlert(title: "Alert", message: successReponse.message!, messagetype: 1)
                self.moveonHome()
            } else {
                ShareData.hideProgress()
                Zalert.showAlert(title: "Alert", message: successReponse.message!, messagetype: 0)
                
            }

        }, Failure: {(error) in
            ShareData.hideProgress()
            Zalert.showAlert(title: "Alert", message: error.message, messagetype: 0)

        })
    }
    
    func moveonHome() {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}



