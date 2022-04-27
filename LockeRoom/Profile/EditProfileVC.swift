//
//  EditProfileVC.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 05/06/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {
    
    @IBOutlet weak var btnedit: UIButton!
    var cemeraimg = UIImagePickerController()
    var galleryimage = UIImagePickerController()
    @IBOutlet weak var userimg: UIImageView!
    
    @IBOutlet weak var lblclubname: UILabel!
    
    @IBOutlet weak var txtclubname: UITextField!
    
    
    @IBOutlet weak var lblemail: UILabel!
    
    
    @IBOutlet weak var txtemail: UITextField!
    
    @IBOutlet weak var lblCountery: UILabel!
    
    @IBOutlet weak var txtcountery: UITextField!
    
    @IBOutlet weak var lblcity: UILabel!
    
    @IBOutlet weak var txtcity: UITextField!
    
    @IBOutlet weak var btnSave: UIButton!
    
    
     var cardimage : UIImage?
    var parthurl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
       self.title  = "Edit Profile"
        btnedit.roundButton()
        btnSave.roundButton()
        addBackButton()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userimg.setPath(string: "http://locker.hanfia-faridia.com/" +  (ShareData.shareInfo.userInfo?.collection?.image ?? ""), "UserImage")
        self.txtcountery.text = ShareData.shareInfo.userInfo?.collection?.country
        self.txtcity.text = ShareData.shareInfo.userInfo?.collection?.city
        self.txtclubname.text = ShareData.shareInfo.userInfo?.collection?.club_name
        self.txtemail.text = ShareData.shareInfo.userInfo?.collection?.email
        userimg.roundImg()
    }

    @IBAction func editAction(_ sender: UIButton) {
        PickImag()
    }
    
    
    @IBAction func saveAction(_ sender: UIButton) {
        if isCheck() {
            editClubProfile ()
        }
    }
    

     func isCheck() -> Bool{
    //
            if(self.txtemail.text == ""){
             Zalert.showAlert(title: "Alert".localized, message: "Please Enter The Email".localized, messagetype: 0)
                return false
            }else if(self.txtemail.text?.isValidEmail1 == false){
             Zalert.showAlert(title: "Alert".localized, message: "Please Enter  Valid Email".localized, messagetype: 0)
                return false
            }else if((txtemail.text!.count > 128)){
             Zalert.showAlert(title: "Alert".localized, message: "Please Enter Valid  Email".localized, messagetype: 0)
                return false
            }else if(txtcity.text! == ""){
             Zalert.showAlert(title: "Alert".localized, message: "Please Enter The  City Name".localized, messagetype: 0)
                return false
            }
            else if(txtcountery.text! == ""){
             Zalert.showAlert(title: "Alert".localized, message: "Please Enter The Country Name".localized, messagetype: 0)
                return false
            }
         
            return true
        }
    
    
    func editClubProfile () {
        ShareData.showProgress()
        let dic : [String: Any] =  ["club_name":txtclubname.text!,"country":txtcountery.text!,"email":txtemail.text!,"city":txtcity.text!]
        
//        if cardimage != nil {
//            dic.updateValue(cardimage!, forKey:"image")
//
//            } else {
//            dic.updateValue(cardimage!, forKey:"image")
//        }
        
        
        userhandler.updateProfile(parms: dic, img: cardimage ?? UIImage() , Success: {response in
            ShareData.hideProgress()
            if response.success! {
                ShareData.shareInfo.userData(User: response.data!)

                ShareData.shareInfo.email = self.txtemail.text
            } else {
                ShareData.hideProgress()
                Zalert.showAlert(title: "Alert".localized, message: response.message!.localized, messagetype: 0)
            }
        }, Failure: {error in
            ShareData.hideProgress()
            Zalert.showAlert(title: "Alert".localized, message: error.message.localized, messagetype: 0)
        })
    }
    
    
    
    
    
    
    
    
    func PickImag() {
            let alert = UIAlertController(title: "Please Select an Option".localized, message: "", preferredStyle: .actionSheet)
            let Gallry = UIAlertAction(title: "Photo Library", style: .default){ (Picimg) in self.GalleryPic()
            }
            let camraimg = UIAlertAction(title: "Camera", style: .default){ (ac) in self.cemeraPic()
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel){(action) in self.cancel()
                
            }
            
            alert.addAction(Gallry)
            alert.addAction(camraimg)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
            
        }
        func cancel()
        {
            self.galleryimage.dismiss(animated: true, completion: nil)
        }
        
        func cemeraPic()
        {
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                cemeraimg.sourceType = .camera
                cemeraimg.delegate = self
                cemeraimg.allowsEditing = false
                present(cemeraimg, animated: true, completion: nil)
            }
            else {
                
                let alert = UIAlertController(title: "Camera".localized, message: "Camera is not available".localized, preferredStyle: .actionSheet)
                let alertaction = UIAlertAction(title: "Cancel".localized, style: .cancel)
                alert.addAction(alertaction)
                present(alert, animated: true, completion: nil)
                
            }
        }
        func GalleryPic()
        {
            if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
            {
                galleryimage.delegate = self
                galleryimage.allowsEditing = false
                galleryimage.sourceType = UIImagePickerController.SourceType.photoLibrary
                present(galleryimage, animated: true, completion: nil)
                
            }else{
                
                print("Image is not Available")
                
            }
            
        }
        
        
        
    
}
extension EditProfileVC : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
        let img =  (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        userimg.image = img
        
        cardimage = img
        //self.uploadCardimg()
        dismiss(animated: true, completion: nil)
    }
    
//    func uploadCardimg() {
//        ShareData.showProgress()
//
//        userhandler.uploadCard(img:cardimage! , Success: {Response in
//            ShareData.hideProgress()
//            if Response.success! {
//                //Zalert.showAlert(title: "Alert", message: Response.message!, messagetype: 0)
//                self.parthurl =  Response.data?.collection?.image ?? ""
//
//            } else {
//                ShareData.hideProgress()
//                Zalert.showAlert(title: "Alert".localized, message: Response.message!, messagetype: 0)
//            }
//        }, Failure: {error in
//            ShareData.hideProgress()
//            Zalert.showAlert(title: "Alert".localized, message: error.message, messagetype: 0)
//        })
//    }
    
    
    
    
    
    
}
