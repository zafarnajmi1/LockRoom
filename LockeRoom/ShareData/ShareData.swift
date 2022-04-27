//
//  ShareData.swift
//  zaraat
//
//  Created by ZafarNajmi on 3/11/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import  UIKit
import  KRProgressHUD
class ShareData {
    static let shareInfo = ShareData()
    private init (){}
    
    var  userInfo : LoginModelData?
    
    func userData(User: LoginModelData){
        userInfo = User
    }
    
    
    
    
    class func showProgress() {
           KRProgressHUD.show()
       }
       
       class func hideProgress() {
           DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
              KRProgressHUD.dismiss()
           }
       }
    
    
    
    var password:String?{
        set{
            UserDefaults.standard.set(newValue , forKey: "password")
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  "password")
        }
    }
    
    var email:String?{
        set{
            UserDefaults.standard.set(newValue , forKey: "email")
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  "email")
        }
    }
    
    var min:String?{
        set{
            UserDefaults.standard.set(newValue , forKey: "min")
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  "min")
        }
    }
    
    var limit:String?{
        set{
            UserDefaults.standard.set(newValue , forKey: "limit")
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  "limit")
        }
    }
    var indx:Int?{
           set{
               UserDefaults.standard.set(newValue , forKey: "indx")
               UserDefaults.standard.synchronize()
           }
           get{
               return UserDefaults.standard.integer(forKey:  "indx")
           }
       }
    
    var licenseKey:String?{
           set{
               UserDefaults.standard.set(newValue , forKey: "licenseKey")
               UserDefaults.standard.synchronize()
           }
           get{
               return UserDefaults.standard.string(forKey:  "licenseKey")
           }
       }
}
