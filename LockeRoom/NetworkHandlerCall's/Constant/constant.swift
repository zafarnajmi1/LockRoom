//
//  constant.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

class Constant {
    
    
    struct instgramUrls {
        static let clientId = "1a50df5f7e4a413b88059ece6c3de03f" //"c09e8026cf0f4335a2fa978ebfa7871e"
        static let redirectUri = "https://www.projects.mytechnology.ae/car-insurance/"//"https://www.projects.mytechnology.ae/car-insurance/en/api/"
       
        static let clientScret = "54786ef7ce44467ba81408c1a9adf89d"
        static let  authorization = "https://api.instagram.com/oauth/authorize/"
        static let scope = "likes+comments+relationships"
    }
   
    static var MainUrl : String { return "http://locker.hanfia-faridia.com/en/api/"
       
        
    }
    
    
    struct activitySize {
        static let size = CGSize(width: 40, height: 40)
    }
    
    enum loaderMessages : String {
        case loadingMessage = "Loading..."
    }
    
    //AuthPArt
    struct URLs {
        
        static let Register = "register"
        static let Login = "login"
        static let Tags = "tag-save"
        static let Listing = "locker-listing"
        static let Logout = "auth/logout"
        static let checkin = "check-in"
        static let upploadimg = "auth/image-upload"
        static let all = "report-listing?all=1"
        static let day = "report-listing?day=1"
         static let week = "report-listing?week=1"
         static let month = "report-listing?month=1"
        static let Termscondition = "terms-conditions"
        static let sendEmail = "generate-monthly-invoice"
        static let forgotPassword = "forgot-password"
        static let resetPAssword = "reset-password"
        static let Checkout = "check-out"
        static let Payment = "payment"
        static let editprofile = "auth/edit-profile"
        static let Licensekey = "ios-key"
    }
    
    struct NetworkErrorType {
        static let timeOutInterval: TimeInterval = 20
        
        static let error = "Error"
        static let internetNotAvailable = "Internet Not Available. Please Try Again"
        static let pleaseTryAgain = "Please Try Again"
        
        static let generic = 4000
        static let genericError = "Please Try Again."
        
        static let serverErrorCode = 5000
        static let serverNotAvailable = "Server Not Available"
        static let serverError = "Server Not Availabe, Please Try Later."
        
        static let timout = 4001
        static let timoutError = "Network Time Out, Please Try Again."
        
        static let login = 4003
        static let loginMessage = "Unable To Login"
        static let loginError = "Please Try Again."
        
        static let internet = 4004
        static let internetError = "Internet Not Available. Please Try Again"
    }
    
    struct NetworkSuccess {
        static let statusOK = 200
    }
    
}

let NOTIFICATIONS_UPDATED = "NOTIFICATIONS_UPDATED"
