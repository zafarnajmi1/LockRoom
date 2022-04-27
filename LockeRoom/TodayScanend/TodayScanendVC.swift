//
//  TodayScanendVC.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 01/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit
import  SDWebImage
import DZNEmptyDataSet
class TodayScanendVC: UIViewController {
    @IBOutlet weak var lblused: UILabel!
    @IBOutlet weak var lbltitleLeft: UILabel!
    
    @IBOutlet weak var lbltitleId: UILabel!
    @IBOutlet weak var lblleft: UILabel!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var botomView: UIView!
    var listing : LockerListingCollection?
    var pagination: LockerListingPagination?
    
    fileprivate func setupDelegates(){
        self.tblView.emptyDataSetSource = self as DZNEmptyDataSetSource
        self.tblView.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
        self.tblView.tableFooterView = UIView()
        self.tblView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.tableFooterView = UIView(frame: .zero)
        tblView.register(UINib.init(nibName: "todayScannedCell", bundle: nil), forCellReuseIdentifier: "todayScannedCell")
        addBackButton()
        lbltitleId.text = "ID's Scanned Today".localized
        lbltitleLeft.text = "ID's Left Today".localized
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getlistingData()
    }
    
    func getlistingData() {
        ShareData.showProgress()
        userhandler.lockerListing(Success: {Response in
            ShareData.hideProgress()
            if Response.success! {
                self.listing = Response.data?.collection
                
                self.lblleft.text = "\(self.listing?.listing?.count ?? 0)"//"\(self.listing?.left ?? 0)"
                self.lblused.text = "\(self.listing?.used ?? 0)"
                if self.listing?.listing?.count == nil || self.listing?.listing?.count == 0 {
                    self.setupDelegates()
                }
                self.tblView.reloadData()
            } else {
                ShareData.hideProgress()
            }
        }, Failure: { error in
            ShareData.hideProgress()
        })
    }
    
    

}
extension TodayScanendVC : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listing?.listing?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todayScannedCell") as? todayScannedCell
        cell!.lblTags.text = "\(self.listing?.listing![indexPath.row].tag_number ?? 0)"
        cell?.cardimg.sd_setImage(with: URL(string:(self.listing?.listing![indexPath.row].id_image ?? "") ))
        return cell!
    }
    
    
}
extension TodayScanendVC: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "Sorry there is no data available".localized
        let attribs = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 19),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> NSAttributedString! {
        let text = "Try Again!".localized
        let attribs = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4965696335, green: 0.1912667751, blue: 0.8802448511, alpha: 1)
            ] as [NSAttributedString.Key : Any] as [NSAttributedString.Key : Any]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!){
        
            self.getlistingData()
        
    }
    
    
    
    
}
