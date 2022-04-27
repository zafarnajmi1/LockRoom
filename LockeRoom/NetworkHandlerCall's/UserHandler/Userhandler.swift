//
//  Userhandler.swift
//  CarInsurance
//
//  Created by Apple on 7/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

import Alamofire




class userhandler {
    
    
    class  func login(parms: [String: Any], Success: @escaping (LoginModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Login
        
        Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
            
            do {
            print("MyResponse : ", successResponse)
                let responseModel = try JSONDecoder().decode(LoginModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    class  func forgotpassword(parms: [String: Any], Success: @escaping (LoginModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.forgotPassword
        
        Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
            
            do {
            print("MyResponse : ", successResponse)
                let responseModel = try JSONDecoder().decode(LoginModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    
    class  func resetPassword(parms: [String: Any], Success: @escaping (ResetPassword) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.resetPAssword
        
        Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
            
            do {
            print("MyResponse : ", successResponse)
                let responseModel = try JSONDecoder().decode(ResetPassword.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    
    class  func Register(parms: [String: Any], Success: @escaping (LoginModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Register
        
        Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
            
            do {
                let responseModel = try JSONDecoder().decode(LoginModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    class  func tagsSave(parms: [String: Any], Success: @escaping (Tags) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Tags
        
        Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
            
            do {
                let responseModel = try JSONDecoder().decode(Tags.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
 
    
   
        
    class  func lockerListing( Success: @escaping (LockerListing) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Listing
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(LockerListing.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
  
    class  func Logout( Success: @escaping (LogOut) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Logout
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(LogOut.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    
    
    
    
    class  func checkin(parms: [String: Any], Success: @escaping (Checkin) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.checkin
        
        Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
            
            do {
                let responseModel = try JSONDecoder().decode(Checkin.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    class  func uploadCard(img:UIImage, Success: @escaping (Uploadimage) -> Void, Failure: @escaping(NetworkError) -> Void){
           let url = Constant.MainUrl + Constant.URLs.upploadimg
           
        Networkhandler.UploadImage(url: url, parameters: nil, userimg:img , Progress: { progresse
             in }, Success: {Successresponse in
                        do {
                          let responseModel = try JSONDecoder().decode(Uploadimage.self, from: Successresponse.data!)
                          Success(responseModel)
                        }
                        catch {
                          print("Response Error")
                              }

        }, Falioure: {Error in
            Failure(Error)
        })
        
        
       }
    
    
    class  func getAll( Success: @escaping (All) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.all
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(All.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    
    class  func getDay( Success: @escaping (Day) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.day
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(Day.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    class  func getMonth( Success: @escaping (Month) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.month
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(Month.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }

    class  func getWeek( Success: @escaping (WeekModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.week
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(WeekModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }

    
    
    
    
    
    
    
    class  func gettermscondition( Success: @escaping (Termscondition) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Termscondition
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(Termscondition.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    class  func sendMonthlyEmail( Success: @escaping (EmailSend) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.sendEmail
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(EmailSend.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    
    
    class  func getCheckOut(parms: [String: Any], Success: @escaping (Checkin) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Checkout
        
        Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
            
            do {
                let responseModel = try JSONDecoder().decode(Checkin.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    class  func getPayment( Success: @escaping (PaymentModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Payment
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                let responseModel = try JSONDecoder().decode(PaymentModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
    
    class  func getCompletePayment(parms: [String: Any], Success: @escaping (CompletPayment) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Payment
        
        Networkhandler.PostRequest(url: url, parameters: parms, success: {(successResponse) in
            
            do {
                let responseModel = try JSONDecoder().decode(CompletPayment.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }
            
            
        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
    
//    class  func updateProfile(parms: [String: Any],img:UIImage, Success: @escaping (LoginModel) -> Void, Failure: @escaping(NetworkError) -> Void){
//        let url = Constant.MainUrl + Constant.URLs.editprofile
//
//        Networkhandler.UploadData(url: url, parameters: parms, userimg: img, Progress: {progress in
//
//        }, Success: {successResponse in
//            do {
//                let responseModel = try JSONDecoder().decode(LoginModel.self, from:)
//                Success(responseModel)
//            }
//            catch {
//                print("Response Error")
//            }
//        }, Falioure: {(Error) in
//            Failure(Error)
//        })
//    }
    class  func updateProfile(parms: [String: Any],img:UIImage, Success: @escaping (LoginModel) -> Void, Failure: @escaping(NetworkError) -> Void){
              let url = Constant.MainUrl + Constant.URLs.editprofile
              
           Networkhandler.UploadData(url: url, parameters: parms, userimg:img , Progress: { progresse
                in }, Success: {Successresponse in
                           do {
                             let responseModel = try JSONDecoder().decode(LoginModel.self, from: Successresponse.data!)
                             Success(responseModel)
                           }
                           catch {
                             print("Response Error")
                                 }

           }, Falioure: {Error in
               Failure(Error)
           })
           
           
          }
    class  func getLicenseKey( Success: @escaping (LicenseKeyModel) -> Void, Failure: @escaping(NetworkError) -> Void){
        let url = Constant.MainUrl + Constant.URLs.Licensekey
        print("pages Url", url)
        Networkhandler.GetRequiest(url: url, parameters: nil,success: {(successResponse) in

            do {
                print(successResponse)
                let responseModel = try JSONDecoder().decode(LicenseKeyModel.self, from: successResponse.data!)
                Success(responseModel)
            }
            catch {
                print("Response Error")
            }


        } , Falioure: {(Error) in
            Failure(Error)
        })
    }
}
    
    
    



