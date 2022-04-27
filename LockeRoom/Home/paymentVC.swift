//
//  paymentVC.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 09/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit
import  Stripe
class paymentVC: UIViewController {
    var paymentCardTextField = STPPaymentCardTextField()
    
    @IBOutlet weak var btncancel: UIButton!
    @IBOutlet weak var lblmonth: UILabel!
    @IBOutlet weak var lblamount: UILabel!
    @IBOutlet weak var lbltotalScans: UILabel!
    let cardParams = STPCardParams()
    
    @IBOutlet weak var btnmakePayment: UIButton!
    
    @IBOutlet weak var topconstraint: NSLayoutConstraint!
    var id = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btncancel.setTitle("Cancel".localized, for: .normal)
        btnmakePayment.setTitle("Payment".localized, for: .normal)
        btnmakePayment.roundButton()
       // self.navigationController?.navigationBar.isHidden =  true
        initializeStripeTextField()
      
        //topconstraint.constant =   UIScreen.main.bounds.height / 4
        self.getpaymentApiCall()
    }
    

    func initializeStripeTextField() {
        // Initialize textField size
        paymentCardTextField.frame = CGRect(x: 15, y: 420 , width: self.view.frame.width - 30, height: 60)
        // Changing textField background color
        paymentCardTextField.backgroundColor = .white
        // Setting the delegate (will be implemented later)
        paymentCardTextField.delegate = self
        // Adding the textField to the view
        view.addSubview(paymentCardTextField)
        // optional: hide the button until the payment data entered
        //payButton.isHidden = true
        
//          cardParams.number = paymentCardTextField.cardNumber
//          cardParams.expMonth = (paymentCardTextField.expirationMonth)
//          cardParams.expYear = (paymentCardTextField.expirationYear)
//          cardParams.cvc = paymentCardTextField.cvc
         
    }
    
    
    @IBAction func cancelaction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func paymentAction(_ sender: UIButton) {
        getToken()
    }
    
    
    
    func getpaymentApiCall(){
        ShareData.showProgress()
        userhandler.getPayment(Success: {Response  in
            ShareData.hideProgress()
            if Response.success! {
                self.id = (Response.data?.collection?.id)!
                self.lblmonth.text = "Pay Of The Month : " + (Response.data?.collection?.payment_month ?? "")
                self.lbltotalScans.text = "Total Scan's : " + "\(Response.data?.collection?.total_scans ?? 0)"
                self.lblamount.text = "Total Payable Amount : " + "$\(Response.data?.collection?.total_payed ?? 0)"
            }else {
                ShareData.hideProgress()
                self.dismiss(animated: true, completion: nil)
                Zalert.showAlert(title: "Alert", message: Response.message!, messagetype: 0)
            }
        }, Failure: {error in
            
            ShareData.hideProgress()
            self.dismiss(animated: true, completion: nil)
            Zalert.showAlert(title: "Alert", message: error.message, messagetype: 0)
        })
    }
    
    

}
extension paymentVC : STPAddCardViewControllerDelegate,STPPaymentCardTextFieldDelegate {
    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        print("i am Key",addCardViewController.apiClient.publishableKey)
         dismiss(animated: true, completion: nil)
    }
    
    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreatePaymentMethod paymentMethod: STPPaymentMethod, completion: @escaping STPErrorBlock) {
        DispatchQueue.main.async{
            let alert = UIAlertController(title: "My Title", message: "All Data of Card \(paymentMethod.allResponseFields)", preferredStyle: UIAlertController.Style.alert)
            //self.getToken()
            //allResponseFields["exp_year"]
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                print("Data Posiibale", paymentMethod.allResponseFields)
//               let cardParams =  STPCardParams()
//                cardParams.number =
//                       cardParams.expMonth =
//                       cardParams.expYear =
//                       cardParams.cvc
//                STPAPIClient.shared().createToken(withCard: cardParams,  STPCardParams) { (token: STPToken?, error: Error?) in
//                        guard let token = token, error == nil else {
//                            print("Error Of payment",error!.localizedDescription)
//                            return
//                        }
//                        print("payment Token ID",token.tokenId)
//                //        self.dictPayData["stripe_token"] = token.tokenId
//                //        print(self.dictPayData)
//                        }
            }))

            // show the alert
            self.dismiss(animated: true, completion: nil)
            self.present(alert, animated: true, completion: nil)
            print("Stripe ID",paymentMethod.stripeId)
        }
        
    }
    
    
    
    
    
    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreateToken token: STPToken, completion: @escaping STPErrorBlock) {
        print("i am token ",token.tokenId)
        let alert = UIAlertController(title: "My Title", message: "This is your Token ID : \(token.tokenId)", preferredStyle: UIAlertController.Style.alert)

          // add an action (button)
          alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

         
        
        
        
        
 
    }
     
    
    
    
     func getToken(){
        
        ShareData.showProgress()
        let cardParams =  STPCardParams()
        
        cardParams.number = paymentCardTextField.cardNumber
        cardParams.expMonth = (paymentCardTextField.expirationMonth)
        cardParams.expYear = (paymentCardTextField.expirationYear)
        cardParams.cvc = paymentCardTextField.cvc
        
        STPAPIClient.shared().createToken(withCard: cardParams) { (token: STPToken?, error: Error?) in
        guard let token = token, error == nil else {
            DispatchQueue.main.async{
                let alert = UIAlertController(title: "Alert".localized, message: " Token Error  :  \(error?.localizedDescription ?? "")", preferredStyle: UIAlertController.Style.alert)
                                     //self.getToken()
                                     //allResponseFields["exp_year"]
                                     alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                                         
                                    self.dismiss(animated: true, completion: nil)
                                     }))

                                     // show the alert
                                     
                                     self.present(alert, animated: true, completion: nil)
                                    
                                 }
                   
            //        self.dictPayData["stripe_token"] = token.tokenId
            //        print(self.dictPayData)
                    
            return
        }
//             DispatchQueue.main.async{
//                let alert = UIAlertController(title: "Alert".localized, message: "Payment Token  :  \(token)", preferredStyle: UIAlertController.Style.alert)
//                         //self.getToken()
//                         //allResponseFields["exp_year"]
//                alert.addAction(UIAlertAction(title: "OK".localized, style: UIAlertAction.Style.default, handler: { action in
//                              self.dismiss(animated: true, completion: nil)
//
//                         }))
//
//                         // show the alert
//
//                         self.present(alert, animated: true, completion: nil)
//
//                     }
            
            self.completePayment(token: "\(token)", id: self.id)
            
            print("Token ", token)
       
//        self.dictPayData["stripe_token"] = token.tokenId
//        print(self.dictPayData)
        }
    }
    
    
    
    func completePayment(token: String,  id: Int) {
        
        let dic : [String:Any] = ["payment_token":token, "transaction_id":id]
        userhandler.getCompletePayment(parms: dic, Success: {response in
            ShareData.hideProgress()
            if  response.success! {
                self.alertMessage(message: "Payment Complete Successfully ", completionHandler: {
                    self.dismiss(animated: true, completion: nil)
                })
            } else {
                ShareData.hideProgress()
                self.alertMessage(message: "Something went wrong ", completionHandler: {
                self.dismiss(animated: true, completion: nil)
                })
            }
        }, Failure: {error in
            ShareData.hideProgress()
            self.alertMessage(message: error.message, completionHandler: {
            self.dismiss(animated: true, completion: nil)
            })
        })
    }
    
    
    
    }
