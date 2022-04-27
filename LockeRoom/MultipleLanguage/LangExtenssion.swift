//
//  LangExtenssion.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 25/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import Foundation
import  UIKit

    extension String {
    var localized: String {
        //UserDefaults.standard.string(forKey: "i18n_language")
        if let _ = AppUserDefault.shared.saveLanguage  {} else {
            // we set a default, just in case
            //            UserDefaults.standard.set("en", forKey: "i18n_language")
            UserDefaults.standard.synchronize()
        }
        
        let lang =  AppUserDefault.shared.saveLanguage//UserDefaults.standard.string(forKey: "i18n_language")
        
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        }
}


enum LanguageType:String {
    case en
    case ar
    case fr
    case it
}
//selected default
var myDefaultLanguage = LanguageType.en
class AppLanguage {
    
    static func updateUIScreenDirection()  {
        switch myDefaultLanguage.rawValue {
        case "ar":
            UIView.appearance().semanticContentAttribute = .forceRightToLeft //ar
            UITableViewCell.appearance().semanticContentAttribute = .forceRightToLeft
            UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
            UITabBar.appearance().semanticContentAttribute = .forceRightToLeft
        default: // .en
            UIView.appearance().semanticContentAttribute = .forceLeftToRight //en
            UITableViewCell.appearance().semanticContentAttribute = .forceLeftToRight
            UINavigationBar.appearance().semanticContentAttribute = .forceLeftToRight
            UITabBar.appearance().semanticContentAttribute = .forceLeftToRight
        }
    }
    
    static func updateLabelsDirection(_ labels: [UILabel])  {
        
        switch myDefaultLanguage.rawValue {
        case "ar":
            for label in labels {
                label.textAlignment = .right
            }
       case "fr":
            for label in labels {
                label.textAlignment = .left
            }
            case "it":
            for label in labels {
                label.textAlignment = .left
            }
        default: // .en
            for label in labels {
                label.textAlignment = .left
            }
        }
    }
    
    static func updateTextFieldsDirection(_ textFields: [UITextField])  {
        
        switch myDefaultLanguage.rawValue {
        case "ar":
            for tf in textFields {
                tf.textAlignment = .right
            }
       case "fr":
            for tf in textFields {
                tf.textAlignment = .left
            }
      case "it":
            for tf in textFields {
                tf.textAlignment = .left
            }
        default: // .en
            for tf in textFields {
                tf.textAlignment = .left
            }
        }
    }
    
    static func updateTextViewsDirection(_ textViews: [UITextView])  {
        
        switch myDefaultLanguage.rawValue {
        case "ar":
            for tf in textViews {
                tf.textAlignment = .right
            }
      case "fr":
            for tf in textViews {
                tf.textAlignment = .left
            }
    case "it":
            for tf in textViews {
                tf.textAlignment = .left
            }
        default: // .en
            for tf in textViews {
                tf.textAlignment = .left
            }
        }
    }
}

class AppUserDefault {
static let shared = AppUserDefault()
    private init(){}
    
    var saveLanguage:String?{
        set{
            UserDefaults.standard.set(newValue , forKey: "saveLanguage")
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.string(forKey:  "saveLanguage")
        }
    }
    
    
}
