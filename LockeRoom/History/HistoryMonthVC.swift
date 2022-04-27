//
//  HistoryMonthVC.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 01/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit
import  XLPagerTabStrip
import  DZNEmptyDataSet
class HistoryMonthVC: UIViewController,IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Month".localized)
        }
        
        @IBOutlet weak var tblView: UITableView!
    
   @IBOutlet weak var lbltitleScanned: UILabel!
   @IBOutlet weak var lblunpayedScnned: UILabel!
   
   @IBOutlet weak var lbltotalAmount: UILabel!
    
    
    @IBOutlet weak var unpayedScans: UILabel!
    @IBOutlet weak var lblamount: UILabel!
    @IBOutlet weak var lbltotlaScans: UILabel!
        var monthlist = [MonthReport_listing]()
    var carddata : MonthCard?
 @IBOutlet weak var totView: UIView!
    
    fileprivate func setupDelegates(){
        self.tblView.emptyDataSetSource = self as DZNEmptyDataSetSource
        self.tblView.emptyDataSetDelegate = self as DZNEmptyDataSetDelegate
        self.tblView.tableFooterView = UIView()
        self.tblView.reloadData()
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
           lbltitleScanned.text = "Total Scanned: ".localized
           lblunpayedScnned.text = "Unpayed Scanned: ".localized
           lbltotalAmount.text = "Total Due Amount : ".localized
            totView.layer.cornerRadius =  10
            totView.layer.borderWidth = 1
            totView.layer.borderColor = #colorLiteral(red: 0.4965696335, green: 0.1912667751, blue: 0.8802448511, alpha: 1)
            tblView.register(UINib.init(nibName: "MonthCell", bundle: nil), forCellReuseIdentifier: "MonthCell") 
        }
        
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        monthApiCall()
    }

        

    func monthApiCall(){
        ShareData.showProgress()
        userhandler.getMonth(Success: {response in
            ShareData.hideProgress()
            if response.success! {
                self.monthlist = response.data?.collection?.report_listing ?? []
                self.carddata  = response.data?.collection?.card
                self.lbltotlaScans.text = "\(self.carddata?.total_scanned ?? 0)"
                self.unpayedScans.text = "$\(self.carddata?.total_payed ?? 0)"
                self.lblamount.text = "$\(self.carddata?.total_payed ?? 0)"
                if self.monthlist.count == 0 {
                    self.setupDelegates()
                }
                self.tblView.reloadData()
            } else {
                  ShareData.hideProgress()
                Zalert.showAlert(title: "Alert".localized, message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
              ShareData.hideProgress()
            Zalert.showAlert(title: "Alert".localized, message: error.message, messagetype: 0)
            
            
        })
    }
    
    
    
    
    }
    extension HistoryMonthVC: UITableViewDelegate,UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 90
        }
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.monthlist.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MonthCell") as? MonthCell
            cell?.lblscans.text = "\(monthlist[indexPath.row].total_scanned ?? 0)"
            cell?.lbldate.text = "\(monthlist[indexPath.row].time_interval_string ?? "")"
            cell?.lblamount.text = "$\(monthlist[indexPath.row].total_payed ?? 0)"
            return cell!
        }
        
        
    }
extension HistoryMonthVC: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "Sorry there is no data available"
        let attribs = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 19),
            NSAttributedString.Key.foregroundColor: UIColor.darkGray
        ]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> NSAttributedString! {
        let text = "Try Again!"
        let attribs = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4965696335, green: 0.1912667751, blue: 0.8802448511, alpha: 1)
            ] as [NSAttributedString.Key : Any] as [NSAttributedString.Key : Any]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!){
        
            self.monthApiCall()
        
    }
    
    
    
    
}
