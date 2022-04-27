//
//  SettingVC.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 01/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    
    var SettingList = ["Number of Physical Tags Available","Profile","Pay To Company","Language","Contact Us","Terms & Conditions","Logout"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Lockeroom"
        tblView.register(UINib.init(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier:"SettingCell")
        
        tblView.tableFooterView = UIView(frame: .zero)
      
        addBackButton()
    }
    

    
     func tagsAction() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc =  storyboard.instantiateViewController(withIdentifier: "LimitsVC") as! LimitsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func ContactUs() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc =  storyboard.instantiateViewController(withIdentifier: "ContactUSVC") as! ContactUSVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
 func languageAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc =  storyboard.instantiateViewController(withIdentifier: "LanguagVC") as! LanguagVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
     func mailAction() {
        
        let alertController = UIAlertController(title: "Alert".localized, message: "Are you sure you want to Generate  a Month Invoice  and Sent to Mail".localized, preferredStyle: UIAlertController.Style.alert)

        let okAction = UIAlertAction(title: "OK".localized, style: .default, handler: {(cAlertAction) in
                    
                    self.genrateEmail()
        //            //Redirect to Settings app
        //            UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
                })

        let cancelAction = UIAlertAction(title: "Cancel".localized, style: UIAlertAction.Style.cancel)
                alertController.addAction(cancelAction)

                alertController.addAction(okAction)

                self.present(alertController, animated: true, completion: nil)
    }
    
    func termsAction() {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TermsConditionsVC") as? TermsConditionsVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    
    
     func logoutAction() {
        
        
        let alertController = UIAlertController(title: "Alert", message: "Are you sure you want to Logout?".localized, preferredStyle: UIAlertController.Style.alert)

        let okAction = UIAlertAction(title: "OK".localized, style: .default, handler: {(cAlertAction) in
            self.logoutApiCall()
            
//            //Redirect to Settings app
//            UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
        })

        let cancelAction = UIAlertAction(title: "Cancel".localized, style: UIAlertAction.Style.cancel)
        alertController.addAction(cancelAction)

        alertController.addAction(okAction)

        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    func logoutApiCall() {
        ShareData.showProgress()
        userhandler.Logout(Success: {success in
            ShareData.hideProgress()
            if success.success! {
                ShareData.shareInfo.userInfo = nil
                ShareData.shareInfo.password = nil
                ShareData.shareInfo.email = nil
                ShareData.shareInfo.min = nil
                ShareData.shareInfo.limit = nil

                self.moveonLogin()
            } else {
                ShareData.hideProgress()
                Zalert.showAlert(title: "Alert".localized, message: success.message!, messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            Zalert.showAlert(title: "Alert".localized, message: error.message, messagetype: 0)
        })
    }
    
    
    
    func genrateEmail() {
        ShareData.showProgress()
        userhandler.sendMonthlyEmail(Success: {response in
            ShareData.hideProgress()
            if response.success! {
                Zalert.showAlert(title: "Alert".localized, message: response.message!, messagetype: 1)
            }else {
                 ShareData.hideProgress()
                Zalert.showAlert(title: "Alert".localized, message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
             ShareData.hideProgress()
            Zalert.showAlert(title: "Alert".localized, message: error.message, messagetype: 0)
        })
    }
    
    func moveonLogin() {
       let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    
    
    
    
    func paymentAcction() {
    
       if let presentedViewController = self.storyboard?.instantiateViewController(withIdentifier: "paymentVC") as? paymentVC {
           presentedViewController.providesPresentationContextTransitionStyle = true
           presentedViewController.definesPresentationContext = true
           presentedViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
           //presentedViewController.view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
           self.present(presentedViewController, animated: true, completion: nil)
       }
        
    }
    
    
    
}
extension SettingVC: UITableViewDelegate,UITableViewDataSource  {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell") as! SettingCell
        cell.lblname.text = SettingList[indexPath.row].localized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let inx = indexPath.row
        switch inx {
            
        case 0:
            tagsAction()
        case 1:
            moveOnProfile()
        case 2:
           
            paymentAcction()
            
        case 3:
           languageAction()
        
        case 4:
           ContactUs()
        case 5:
          termsAction()
        case 6:
            logoutAction()
          
        default:
            break
        }
        
        
    }
    func moveOnProfile() {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ViewProfileVc") as? ViewProfileVc
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
}
