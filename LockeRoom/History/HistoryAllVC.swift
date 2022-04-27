//
//  HistoryAllVC.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 01/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit
import  XLPagerTabStrip

class HistoryAllVC: UIViewController,IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "ALL".localized)
        }
        
    
    @IBOutlet weak var unpayedScans: UILabel!
    @IBOutlet weak var lblamount: UILabel!
    @IBOutlet weak var lbltotlaScans: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var lbltitleScanned: UILabel!
    @IBOutlet weak var lblunpayedScnned: UILabel!
    
    @IBOutlet weak var lbltotalAmount: UILabel!
        
       @IBOutlet weak var totView: UIView!
    
    var allArray : AllCollection?
    
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            lbltitleScanned.text = "Total Scanned: ".localized
            lblunpayedScnned.text = "Unpayed Scanned: ".localized
            lbltotalAmount.text = "Total Due Amount : ".localized
            totView.layer.cornerRadius =  10
            totView.layer.borderWidth = 1
            totView.layer.borderColor = #colorLiteral(red: 0.4965696335, green: 0.1912667751, blue: 0.8802448511, alpha: 1)
            tblView.register(UINib.init(nibName: "AllCell", bundle: nil), forCellReuseIdentifier: "AllCell")
        }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        allApiCall()
    }
        
    func allApiCall() {
        ShareData.showProgress()
        userhandler.getAll(Success: {response in
            ShareData.hideProgress()
            if response.success! {
                self.allArray = response.data?.collection
                
                self.lblamount.text = "$\(self.allArray?.card?.total_payed ?? 0)"
                self.lbltotlaScans.text = "\(self.allArray?.card?.total_scanned ?? 0)"
                 self.unpayedScans.text = "$\(self.allArray?.card?.total_payed ?? 0)"
                
                self.tblView.reloadData()
            }else {
                 ShareData.hideProgress()
                Zalert.showAlert(title: "Alert".localized, message: response.message!, messagetype: 0)
            }
        }, Failure: {error in
             ShareData.hideProgress()
            Zalert.showAlert(title: "Alert".localized, message: error.message, messagetype: 0)
        })
    }
    
    
    
    
    }
    extension HistoryAllVC: UITableViewDelegate,UITableViewDataSource {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 90
        }
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllCell") as? AllCell
            cell?.lbldate.text =   (allArray?.report_data?.first_entry ?? "") + " to " + (allArray?.report_data?.last_entry ?? "")
            cell?.lblprice.text = "$\(allArray?.report_data?.total_payed ?? 0)"
            cell?.lblscans.text = "\(allArray?.report_data?.total_scanned ?? 0)"
            return cell!
        }
        
        
    }
