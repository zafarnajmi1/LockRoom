//
//  HistoryTabVC.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 01/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit
import  XLPagerTabStrip
class HistoryTabVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
               
           self.navigationController?.navigationBar.isTranslucent =  false
               settings.style.selectedBarHeight = 0 //line
        settings.style.buttonBarMinimumLineSpacing = 1
               settings.style.buttonBarItemsShouldFillAvailableWidth = true
               settings.style.buttonBarLeftContentInset = 0
               settings.style.buttonBarRightContentInset = 0
               settings.style.buttonBarBackgroundColor = #colorLiteral(red: 0.4965696335, green: 0.1912667751, blue: 0.8802448511, alpha: 1)
        settings.style.buttonBarMinimumInteritemSpacing = 1
//               settings.style.selectedBarBackgroundColor = #colorLiteral(red: 0.03137254902, green: 0.2980392157, blue: 0.09411764706, alpha: 1)
//                settings.style.selectedBarHeight  = 3
               //settings.style.selectedBarVerticalAlignment = .middle
               
               changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
                   guard changeCurrentIndex == true else { return }
                   oldCell?.label.textColor = #colorLiteral(red: 0.7716163397, green: 0.2765256763, blue: 0.7531380057, alpha: 1)
                   oldCell?.contentView.backgroundColor = #colorLiteral(red: 0.9958658814, green: 1, blue: 0.9999271035, alpha: 1)
                   //oldCell?.label.font = UIFont.init(name: "Poppins-Medium", size: 18)
                   newCell?.label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                   newCell?.contentView.backgroundColor =  #colorLiteral(red: 0.4965696335, green: 0.1912667751, blue: 0.8802448511, alpha: 1)
                   //newCell?.label.font = UIFont.init(name: "Poppins-Medium", size: 18)
       //            if self.isfromorder ==  true{
       //
       //                self.moveToViewController(at: 2)
       //            }
                   
               }

               
               
               super.viewDidLoad()
               addBackButtonRight()
           self.title = "Lockeroom"
           
           }
           
           
           override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
               let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HistoryDailyVC") as? HistoryDailyVC
               let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HistoryWeekVC")  as? HistoryWeekVC
            let child_3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HistoryMonthVC") as? HistoryMonthVC
            let child_4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HistoryAllVC")  as? HistoryAllVC
               
               return [child_1!, child_2!,child_3!,child_4!]
           }
           

           

       }
