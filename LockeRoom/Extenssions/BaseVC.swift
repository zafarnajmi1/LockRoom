//
//  BaseVC.swift
//  zaraat
//
//  Created by ZafarNajmi on 2/28/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        hidnavigationbar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func setnavigationbar() {
        
    }
    
    func hidnavigationbar() {
        self.navigationController?.navigationBar.isHidden =  true
    }
    
    
        }



