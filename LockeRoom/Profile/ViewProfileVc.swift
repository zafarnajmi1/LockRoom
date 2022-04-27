//
//  ViewProfileVc.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 05/06/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit

class ViewProfileVc: UIViewController {

    @IBOutlet weak var btnedit: UIButton!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var countery: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var userimg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title  = "Profile"
        btnedit.roundButton()
        addBackButton()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userimg.setPath(string: "http://locker.hanfia-faridia.com/" +  (ShareData.shareInfo.userInfo?.collection?.image ?? ""), "UserImage")
        self.countery.text = ShareData.shareInfo.userInfo?.collection?.country
        self.city.text = ShareData.shareInfo.userInfo?.collection?.city
        self.name.text = ShareData.shareInfo.userInfo?.collection?.club_name
        self.email.text = ShareData.shareInfo.userInfo?.collection?.email
        userimg.roundImg()
        
    }

    
    
    
    @IBAction func editAction(_ sender: UIButton) {
        moveOnEditProfile()
    }
    
    func moveOnEditProfile() {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "EditProfileVC") as? EditProfileVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}
