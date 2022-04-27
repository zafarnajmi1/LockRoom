//
//  HomeVC.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 01/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit
import  Microblink
import  Stripe
import  Alamofire
class HomeVC: UIViewController {
  
    @IBOutlet weak var scanid: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var lblcheckout: UILabel!
    @IBOutlet weak var lblchkin: UILabel!
    
    @IBOutlet weak var btnConfirom: UIButton!
    @IBOutlet weak var btncancel: UIButton!
    @IBOutlet weak var cardimg: UIImageView!
    @IBOutlet weak var tblView: UITableView!
    //@IBOutlet weak var botomView: UIView!
    @IBOutlet weak var checkOutView: UIView!
    @IBOutlet weak var checkinView: UIView!
    //@IBOutlet weak var scanerView: UIView!
    
    var cardnumber = ""
    var cardimage : UIImage?
    var checkType : Bool?
    struct CardData {
        var title: String?
        var value: String?
        var cardID : String?
    }
    var cardArray = [CardData]()
    var blinkIdRecognizer : MBBlinkIdRecognizer?
    var  passportScan : MBMrtdCombinedRecognizer?
    var p : MBPassportRecognizer?
    var mrt: MBMrtdRecognizer?
    
    
    //var blinkIdRecognizer : MBBl  inkIdCombinedRecognizer?
    
    var paymentCardTextField = STPPaymentCardTextField()
    let cardParams = STPCardParams()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblView.isHidden =  true
        self.bgView.layer.borderWidth = 1
         self.bgView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        setUpHome()
        
        
        self.tblView.register(UINib.init(nibName: "CardCell", bundle: nil), forCellReuseIdentifier: "CardCell")
        btnConfirom.isHidden =  true
        btncancel.isHidden =  true
        btncancel.layer.cornerRadius = 8
        btncancel.layer.borderWidth = 1
        btncancel.layer.borderColor = #colorLiteral(red: 0.4965696335, green: 0.1912667751, blue: 0.8802448511, alpha: 1)
        btnConfirom.layer.cornerRadius = 8
        btnConfirom.layer.borderWidth = 1
        btnConfirom.layer.borderColor = #colorLiteral(red: 0.4965696335, green: 0.1912667751, blue: 0.8802448511, alpha: 1)
        cardimg.layer.cornerRadius = 10
        
        licenseKey()
        //initializeStripeTextField()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden =  false
        print(ShareData.shareInfo.licenseKey ?? "")
        MBMicroblinkSDK.sharedInstance().setLicenseKey(ShareData.shareInfo.licenseKey ?? "")
    }
     
    func licenseKey() {
        userhandler.getLicenseKey(Success: {response in
            if response.success! {
                print(response.data?.collection?.content)
                ShareData.shareInfo.licenseKey =  response.data?.collection?.content
            } else {
                
            }
        }, Failure: {error in
            
        })
    }
    
    
//    func initializeStripeTextField() {
//        // Initialize textField size
//        paymentCardTextField.frame = CGRect(x: 15, y: 300, width: self.view.frame.width - 30, height: 60)
//        // Changing textField background color
//        paymentCardTextField.backgroundColor = .white
//        // Setting the delegate (will be implemented later)
//        paymentCardTextField.delegate = self
//        // Adding the textField to the view
//        view.addSubview(paymentCardTextField)
//        // optional: hide the button until the payment data entered
//        //payButton.isHidden = true
//
//          cardParams.number = paymentCardTextField.cardNumber
//          cardParams.expMonth = (paymentCardTextField.expirationMonth)
//          cardParams.expYear = (paymentCardTextField.expirationYear)
//          cardParams.cvc = paymentCardTextField.cvc
//
//    }
    func setUpHome() {
        
        self.btncancel.setTitle("Cancel".localized, for: .normal)
        self.btnConfirom.setTitle("Confirm".localized, for: .normal)
        lblchkin.text = "Check-In".localized
        lblcheckout.text = "Check-Out".localized
        self.checkinView.viewSetUp(radius: 20, color: #colorLiteral(red: 0.4027805328, green: 0.2704743147, blue: 0.9481992126, alpha: 1), borderwidth: 1)
        self.checkOutView.viewSetUp(radius: 20, color: #colorLiteral(red: 0.4027805328, green: 0.2704743147, blue: 0.9481992126, alpha: 1), borderwidth: 1)
    }
    
    

    
    
    @IBAction func ConfirmAction(_ sender: Any) {
        if checkType == true {
            
             uploadCardimg()
        } else {
          checkoutApi()
        }
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.scanid.isHidden =  false
        self.cardArray.removeAll()
        btnConfirom.isHidden =  true
        btncancel.isHidden =  true
        self.cardimg.image = nil
        self.tblView.reloadData()
        self.tblView.isHidden =  true
        
    }
    
    
    func uploadCardimg() {
        ShareData.showProgress()
       
        userhandler.uploadCard(img:cardimage! , Success: {Response in
            
            if Response.success! {
                //Zalert.showAlert(title: "Alert", message: Response.message!, messagetype: 0)
                if self.checkID() {
                    self.checkinApi(img: Response.data?.collection?.image ?? "")
                }
               
            } else {
                ShareData.hideProgress()
                Zalert.showAlert(title: "Alert".localized, message: Response.message!, messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            Zalert.showAlert(title: "Alert".localized, message: error.message, messagetype: 0)
        })
    }
    
    
    func checkID() -> Bool {
        if cardnumber == "" {
            ShareData.hideProgress()
            Zalert.showAlert(title:"Alert".localized, message: "Please Again Scan To Get  The Card ID", messagetype: 0)
            return false
        }
         return true
    }
    
    func showAlert(msg:String) {
        let alert = UIAlertController(title: "Alert".localized, message: "\n\n\nhello ", preferredStyle: .alert)
        let titleAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25), NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleString = NSAttributedString(string: "Tag".localized, attributes: titleAttributes)
        let messageAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25), NSAttributedString.Key.foregroundColor: UIColor.black]
      let messageString = NSAttributedString(string: "\n"+msg, attributes: messageAttributes)
      alert.setValue(titleString, forKey: "attributedTitle")
      alert.setValue(messageString, forKey: "attributedMessage")
        let labelAction = UIAlertAction(title: "OK".localized, style: .default, handler: {action in
            self.scanid.isHidden  =  false
            self.cardArray.removeAll()
            self.btnConfirom.isHidden =  true
            self.btncancel.isHidden =  true
            self.cardimg.image = nil
            self.tblView.reloadData()
            self.tblView.isHidden = true
        })
//      let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
//      let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(labelAction)
//      alert.addAction(deleteAction)
//      alert.addAction(cancelAction)
      self.navigationController?.present(alert, animated: true, completion: nil)

        
        
        
        
    }

    
    
    
    func checkinApi(img: String){
        
        let dic:[String:Any] = ["id_number": cardnumber,"id_image": img]
         
        userhandler.checkin(parms: dic, Success: {Response in
            ShareData.hideProgress()
            if Response.success! {
                self.showAlert(msg: "\(Response.data?.collection?.tag_number ?? 0)")
//                self.alertMessage(message: "Assign The Tag :  \(Response.data?.collection ?? 0)  To This Card", completionHandler: {
//                    self.cardArray.removeAll()
//                    self.btnConfirom.isHidden =  true
//                    self.btncancel.isHidden =  true
//                    self.cardimg.image = nil
//                    self.tblView.reloadData()
//                })
            }else {
                ShareData.hideProgress()
                Zalert.showAlert(title: "Alert".localized, message: Response.message!, messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            Zalert.showAlert(title: "Alert".localized, message: error.message, messagetype: 0)
        })
    }
    
    
    func checkoutApi(){
        let dic:[String:Any] = ["id_number":cardnumber]
        ShareData.showProgress()
        userhandler.getCheckOut(parms: dic, Success: {response in
            ShareData.hideProgress()
            if response.success! {
                self.showAlert(msg: "\(response.data?.collection?.tag_number ?? 0)")
//                self.alertMessage(message: response.message!, completionHandler: {
//                    self.cardArray.removeAll()
//                    self.btnConfirom.isHidden =  true
//                    self.btncancel.isHidden =  true
//                    self.cardimg.image = nil
//                    self.tblView.reloadData()
//                })
            } else {
                ShareData.hideProgress()
                Zalert.showAlert(title: "Alert".localized, message: response.message!, messagetype: 0)
            }
        }, Failure: { error in
            ShareData.hideProgress()
            Zalert.showAlert(title: "Alert".localized, message: error.message, messagetype: 0)
        })
    }
    
    
    
    
    
    @IBAction func checkOutAction(_ sender: Any) {
        checkType = false
        self.setupBlink()
//        if let presentedViewController = self.storyboard?.instantiateViewController(withIdentifier: "paymentVC") as? paymentVC {
//            presentedViewController.providesPresentationContextTransitionStyle = true
//            presentedViewController.definesPresentationContext = true
//            presentedViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
//            //presentedViewController.view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
//            self.present(presentedViewController, animated: true, completion: nil)
//        }
        
//        let config = STPPaymentConfiguration.shared()
//        //config.requiredBillingAddressFields = .full
//        config.companyName = "Lockeroom"
//        config.additionalPaymentOptions = .default
        
//             getToken()
//        let viewController =  STPAddCardViewController()//STPAddCardViewController(configuration: config, theme: STPTheme.default())
//        viewController.delegate = self
//        let navigationController = UINavigationController(rootViewController: viewController)
//        present(navigationController, animated: true, completion: nil)
        
//        print("card data",cardParams)
//        STPAPIClient.shared().createToken(withCard: cardParams) { (token: STPToken?, error: Error?) in
//                guard let token = token, error == nil else {
//                    print("Error Of payment",error!.localizedDescription)
//                    return
//                }
//                print("payment Token ID",token.tokenId)
//        //        self.dictPayData["stripe_token"] = token.tokenId
//        //        print(self.dictPayData)
//                }
        
    }
    
    @IBAction func checkInAction(_ sender: Any) {

        
        
        checkType = true
        setupBlink()
        
    }
    
    @IBAction func scanAction(_ sender: UIButton) {
        
        let config = STPPaymentConfiguration()
        //config.requiredBillingAddressFields = .full
        config.companyName = "Lockeroom"
        config.additionalPaymentOptions = .default
        config.shippingType = .shipping
        
        let viewController = STPAddCardViewController(configuration: config, theme: STPTheme.default())
        viewController.delegate = self
        
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true, completion: nil)
        
    }
    
    
    func setupBlink(){
           
        
              self.blinkIdRecognizer =  MBBlinkIdRecognizer()
                self.p = MBPassportRecognizer()
          self.passportScan = MBMrtdCombinedRecognizer()
        
                //self.blinkIdRecognizer = MBBlinkIdCombinedRecognizer()
                self.blinkIdRecognizer?.returnFullDocumentImage = true;
        self.blinkIdRecognizer?.dewarpedImageDelegate = self
        self.blinkIdRecognizer?.encodeFullDocumentImage = true
        self.blinkIdRecognizer?.classifierDelegate  = self
        self.blinkIdRecognizer?.allowBlurFilter = true
        self.blinkIdRecognizer?.allowUnparsedMrzResults = true
        self.blinkIdRecognizer?.allowUnverifiedMrzResults = true
        
        self.passportScan?.allowSpecialCharacters = true
        self.passportScan?.allowUnparsedResults = true
        self.passportScan?.detectorType = .passportsAndVisas
        self.passportScan?.allowUnverifiedResults = true
        self.passportScan?.encodeFullDocumentImage = true
          
        
        self.p?.anonymizeNetherlandsMrz =  true
        self.p?.encodeFaceImage = true
        self.p?.returnFaceImage = true
        self.p?.returnFullDocumentImage  = true
        self.p?.encodeFullDocumentImage = true
        self.p?.detectGlare = true
        self.p?.encodeFaceImage =  true
        self.p?.accessibilityActivate()
       
       
        
        //self.blinkIdRecognizer = MBBlinkIdRecognizer()

                        /** Create BlinkID settings */
                        
                        let settings : MBBlinkIdOverlaySettings = MBBlinkIdOverlaySettings()
        
                        /** Crate recognizer collection */
        let recognizerList = [self.blinkIdRecognizer!, p!,passportScan!]
        
    let recognizerCollection : MBRecognizerCollection = MBRecognizerCollection(recognizers: recognizerList)

                        /** Create your overlay view controller */
                        let blinkIdOverlayViewController : MBBlinkIdOverlayViewController = MBBlinkIdOverlayViewController(settings: settings, recognizerCollection: recognizerCollection, delegate: self)

                        /** Create recognizer view controller with wanted overlay view controller */
        //                let recognizerRunneViewController : UIViewController = MBViewControllerFactory.recognizerRunnerViewController(withOverlayViewController: blinkIdOverlayViewController)
                let recognizerRunneViewController : UIViewController = MBViewControllerFactory.recognizerRunnerViewController(withOverlayViewController: blinkIdOverlayViewController)
                       recognizerRunneViewController.modalPresentationStyle = .fullScreen
                        /** Present the recognizer runner view controller. You can use other presentation methods as well (instead of presentViewController) */
                        self.present(recognizerRunneViewController, animated: true, completion: nil)
//
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
}

extension HomeVC: MBBlinkIdOverlayViewControllerDelegate,MBBlinkIdRecognizerDelegate {
    
    func blinkIdOverlayViewControllerDidFinishScanning(_ blinkIdOverlayViewController: MBBlinkIdOverlayViewController, state: MBRecognizerResultState) {
        /** This is done on background thread */
        blinkIdOverlayViewController.recognizerRunnerViewController?.pauseScanning()
        
        var message: String = ""
        var title: String = ""
        
        
        if (p?.result.resultState  == MBRecognizerResultState.valid){
            print("i am passport", p?.result.mrzResult.documentNumber)
             message = self.p!.result.description
            print("Message", message)
            DispatchQueue.main.async {
                            // present the alert view with scanned results
            //"Card Has been Scanned".localized
                let alertController: UIAlertController = UIAlertController.init(title: title, message: "Card Has been Scanned".localized, preferredStyle: UIAlertController.Style.alert)

                            let okAction: UIAlertAction = UIAlertAction.init(title: "OK".localized, style: UIAlertAction.Style.default,handler: { (action) -> Void in

                               
                                self.cardimg.image = self.p?.result.fullDocumentImage?.image
                                self.cardimage = self.p?.result.fullDocumentImage?.image
                                   passportData()
                                self.scanid.isHidden =  true
                                self.tblView.isHidden  =  false
                                self.btnConfirom.isHidden =  false
                                self.btncancel.isHidden =  false
                                self.tblView.reloadData()

                                self.dismiss(animated: true, completion: nil)

                            })
                            alertController.addAction(okAction)
                            blinkIdOverlayViewController.present(alertController, animated: true, completion: nil)
                        }
            
            
            
            
        }else if (self.blinkIdRecognizer?.result.resultState == MBRecognizerResultState.valid) {
            title = "Lockeroom"

            let fullDocumentImage: UIImage! = self.blinkIdRecognizer?.result.fullDocumentImage?.image

            print("id card",self.blinkIdRecognizer?.result.driverLicenseDetailedInfo?.endorsements)
            message = self.blinkIdRecognizer!.result.description

            //MBDriverLicenseDetailedInfo
            /** Needs to be called on main thread beacuse everything prior is on background thread */
            DispatchQueue.main.async {
                // present the alert view with scanned results
//"Card Has been Scanned".localized
                let alertController: UIAlertController = UIAlertController.init(title: title, message:"Card Has been Scanned".localized , preferredStyle: UIAlertController.Style.alert)

                let okAction: UIAlertAction = UIAlertAction.init(title: "OK".localized, style: UIAlertAction.Style.default,handler: { (action) -> Void in


                    self.cardimg.image = fullDocumentImage
                    self.cardimage = fullDocumentImage
                    
                    setValueOfCard()
                    self.scanid.isHidden =  true
                    self.tblView.isHidden  =  false
                    self.btnConfirom.isHidden =  false
                    self.btncancel.isHidden =  false
                    self.tblView.reloadData()

                    self.dismiss(animated: true, completion: nil)

                })
                alertController.addAction(okAction)
                blinkIdOverlayViewController.present(alertController, animated: true, completion: nil)
            }
        }
            
        
        
        
        func passportData() {
            self.cardArray.removeAll()
            
                if self.p!.result.mrzResult.documentNumber.isEmpty != true {
                    self.cardArray.append(CardData(title: "Card Number :", value: "\(self.p!.result.mrzResult.documentNumber  )"))
                    self.cardnumber =  self.p!.result.mrzResult.documentNumber
                    }

                if self.p!.result.mrzResult.immigrantCaseNumber.isEmpty != true {
                    self.cardArray.append(CardData(title: "Card Number :", value: "\(self.p!.result.mrzResult.immigrantCaseNumber  )"))
                     self.cardnumber =  self.p!.result.mrzResult.immigrantCaseNumber
                    }

                if self.p!.result.mrzResult.alienNumber.isEmpty != true {
                    self.cardArray.append(CardData(title: "Card Number :", value: "\(self.p!.result.mrzResult.alienNumber  )"))
                    self.cardnumber =  self.p!.result.mrzResult.alienNumber
                           }

                if self.p!.result.mrzResult.primaryID.isEmpty != true {
                    self.cardArray.append(CardData(title: "Name :", value: "\(self.p!.result.mrzResult.primaryID  )"))

                    }
//                if self.p!.result.mrzResult.nationalityName.isEmpty != true {
//                       self.cardArray.append(CardData(title: "Nationality Name :", value: "\(self.p!.result.mrzResult.nationalityName  )"))
//
//                       }
                            
    }
        
            
            
            func setValueOfCard() {
                self.cardArray.removeAll()

//     if self.blinkIdRecognizer!.result.documentAdditionalNumber?.isEmpty != true {
//                                self.cardArray.append(CardData(title: "Card Number :", value: "\(self.blinkIdRecognizer!.result.documentAdditionalNumber ?? "")"))
//                    self.cardnumber =  self.blinkIdRecognizer!.result.documentAdditionalNumber ?? ""
//              }


                if self.blinkIdRecognizer!.result.documentNumber?.isEmpty != true {
                                self.cardArray.append(CardData(title: "Card Number :", value: "\(self.blinkIdRecognizer!.result.documentNumber ?? "")"))
                    self.cardnumber = self.blinkIdRecognizer!.result.documentNumber ?? ""

                }


                if self.blinkIdRecognizer!.result.firstName?.isEmpty != true {
                                self.cardArray.append(CardData(title: "First Name :", value: "\(self.blinkIdRecognizer!.result.firstName ?? "")"))
             }

                if self.blinkIdRecognizer!.result.lastName?.isEmpty != true {
                                self.cardArray.append(CardData(title: "Last Name :", value: "\(self.blinkIdRecognizer!.result.lastName ?? "")"))
             }

                if self.blinkIdRecognizer!.result.fullName?.isEmpty != true {
                                self.cardArray.append(CardData(title: "Full Name :", value: "\(self.blinkIdRecognizer!.result.fullName ?? "")"))
            }


                if self.blinkIdRecognizer!.result.personalIdNumber?.isEmpty != true {
                                self.cardArray.append(CardData(title: "Card Number :", value: self.blinkIdRecognizer!.result.personalIdNumber, cardID: self.blinkIdRecognizer!.result.personalIdNumber))
                     self.cardnumber = self.blinkIdRecognizer!.result.personalIdNumber ?? ""
                 }
                

                if self.blinkIdRecognizer!.result.mrzResult.documentCode.isEmpty != true {
                    self.cardArray.append(CardData(title: "Card Number :", value: "\(self.blinkIdRecognizer!.result.mrzResult.documentCode)"))
                    self.cardnumber =  self.blinkIdRecognizer!.result.mrzResult.documentCode
                }

                
               


            }



        
    }
    
    func blinkIdOverlayViewControllerDidTapClose(_ blinkIdOverlayViewController: MBBlinkIdOverlayViewController) {
        self.dismiss(animated: true, completion: nil)
        self.tblView.reloadData()
    }
}


extension HomeVC :  UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CardCell") as? CardCell
        cell?.lbltitle.text = cardArray[indexPath.row].title?.localized
        cell?.lblValue.text = cardArray[indexPath.row].value?.localized
        return cell!
    }
    
    
}


extension HomeVC : STPAddCardViewControllerDelegate,STPPaymentCardTextFieldDelegate {
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
        let cardParams =  STPCardParams()
        
        cardParams.number = paymentCardTextField.cardNumber
        cardParams.expMonth = (paymentCardTextField.expirationMonth)
        cardParams.expYear = (paymentCardTextField.expirationYear)
        cardParams.cvc = paymentCardTextField.cvc
        
        STPAPIClient.shared().createToken(withCard: cardParams) { (token: STPToken?, error: Error?) in
        guard let token = token, error == nil else {
            print("Error Of payment",error?.localizedDescription)
            return
        }
        print("payment Token ID",token.tokenId)
//        self.dictPayData["stripe_token"] = token.tokenId
//        print(self.dictPayData)
        }
    }
    
    }

