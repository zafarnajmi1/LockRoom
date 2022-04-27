//
//  LanguagVC.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 03/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit

class LanguagVC: BaseVC {
  var langArr = ["English","French"]
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Select Language"
       addBackButton()
        tblView.register(UINib.init(nibName: "LanguageCell", bundle: nil), forCellReuseIdentifier: "LanguageCell")
        tblView.tableFooterView = UIView.init(frame: .zero)
        
        
    }
    override func hidnavigationbar() {
        self.navigationController?.navigationBar.isHidden =  false
    }

    

}
extension LanguagVC:  UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return langArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  =  tableView.dequeueReusableCell(withIdentifier: "LanguageCell") as? LanguageCell
        cell!.lbllang.text = langArr[indexPath.row]
        
        if ShareData.shareInfo.indx == indexPath.row{
            cell!.accessoryType = .checkmark
        }else{
            cell!.accessoryType = .none
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indx = indexPath.row
        switch indx {
        case 0:
            ShareData.shareInfo.indx = indexPath.row
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            english()
        case 1:
            ShareData.shareInfo.indx = indexPath.row
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            Frech()
        
        default:
            break
        }
        
        
    }
    
    
    func english(){
        
                myDefaultLanguage = .en
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                AppUserDefault.shared.saveLanguage = myDefaultLanguage.rawValue
                
                
                if  ShareData.shareInfo.password != nil &&  ShareData.shareInfo.email != nil {
                           moveonHome()
                       } else {
                           
                           moveonLogin()
                       }
    }
    func Frech(){
        
                myDefaultLanguage = .fr
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                AppUserDefault.shared.saveLanguage = myDefaultLanguage.rawValue
                
                
                if  ShareData.shareInfo.password != nil &&  ShareData.shareInfo.email != nil {
                           moveonHome()
                       } else {
                           
                           moveonLogin()
                       }
    }
    
    
    func Italian(){
        
                myDefaultLanguage = .it
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                AppUserDefault.shared.saveLanguage = myDefaultLanguage.rawValue
                
                
                if  ShareData.shareInfo.password != nil &&  ShareData.shareInfo.email != nil {
                           moveonHome()
                       } else {
                           
                           moveonLogin()
                       }
    }
    
    
    func moveonHome() {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    func moveonLogin() {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
