//
//  AppDelegate.swift
//  LockeRoom
//
//  Created by Zafar Najmi on 01/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import UIKit
import CoreData
import Microblink
import  IQKeyboardManagerSwift
import  Stripe
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        MBMicroblinkSDK.sharedInstance().setLicenseKey("sRwAAAEaY29tLmRpcmFuaWNlbGluZS5sb2NrZXJvb21nC7ccQaBMWtQNCvK4We27xPODh6xOu5c/TgronUBINq3PESWB8lWZJ7QYv+nl9umJcw7R+EsIoWEOtLKyF67u630rYVgnU4DfEY0xsrj4kOaGSQsEGxjMvMa0REd8Z4S3nOY+qs5qjkXqifnEh9oVEYyNlgecuQHznBMhZQCbaO8WNU4lkcVL0vEVmELUZ+crtDPm8QBepbKQcTPpLQpNXFCOIk4Nyk6ojjEuSsjQQYBruUX9+KgIUH/dxZCeH0UQOEDsFJ0Z5oM=")
        licenseKey()
            IQKeyboardManager.shared.enable = true
        Stripe.setDefaultPublishableKey("pk_test_NZACLPNJHjUehxJs02EPPXgE00PYwetbta")
        
        //STPPaymentConfiguration.shared().publishableKey = "pk_test_flKPDyGufDtdaG2i4uf3Wnll002gxTnz0b"
        /*sRwAAAEaY29tLmRpcmFuaWNlbGluZS5sb2NrZXJvb21nC7ccQaBMWtQNCvK8GeK7N8BoTh8EsilhbmoSfDY95nrR/AvpbkRhRgqWpPne8Znx1NbBJQ1NNW4SPe437M2WF27078+odSvqRezeYalB/Q06gOUp9ryRcpOjPxtu9fCjJ689mRZXURUB+vCL/qQ0uzfUsMNhjTy48oEKWAbkL6I1Asy8YKpENYJ3V4wmyUTKkoKbvwBHriIhueg9LH2QQ1Mc+F2hNyKEx9hE0kN9t0c5dAbWHJSdMqJziWXkzQAoIPRqGjEFz/9QU5LVsh0=*/
        
        /*sRwAAAETY29tLnphZmFyLmxvY2tlcm9vbdUCqRHTgbs2Jvh92pqDU36Izyh1Z31P90up3YNMiuaVMWISu6fNHR7EHbUwbNnGc/inOJQJlnX0im/nWISAB2QI9pzjqtogKO5jL1tGsthJNc3QX4P9ewOqNW72e9KOpyyv5L9BBamrYW8Phn1BkqqF6eBhC0GdY9OFNHsZ2X+nHk5/ql7kH98MJkUewirsxQ5Ia5zxv7yT+yA1osqImPsBW6hlS3lQ0kR90j2WVrpjqvQDxOQeCFiLqGFFicoTYRL+RIXJLbFlTl63fI14Ng==*/
        if let saveLanguage = AppUserDefault.shared.saveLanguage{
                  switch saveLanguage{
                  case "ar":
                      UIView.appearance().semanticContentAttribute = .forceRightToLeft
                   
                      myDefaultLanguage = .ar
                  case "it":
                    //AppUserDefault.shared.saveLanguage = myDefaultLanguage.rawValue
                    UIView.appearance().semanticContentAttribute = .forceLeftToRight
                    myDefaultLanguage = .it
                  case "fr" :
                    //AppUserDefault.shared.saveLanguage = myDefaultLanguage.rawValue
                    UIView.appearance().semanticContentAttribute = .forceLeftToRight
                    myDefaultLanguage = .fr
                  default :
                      
                      //AppUserDefault.shared.saveLanguage = myDefaultLanguage.rawValue
                      UIView.appearance().semanticContentAttribute = .forceLeftToRight
                      myDefaultLanguage = .en
                  }
                  
                
              }
        
        
        return true
    }

    
    
    func licenseKey() {
        userhandler.getLicenseKey(Success: {response in
            if response.success! {
                
                ShareData.shareInfo.licenseKey =  response.data?.collection?.content
            } else {
                
            }
        }, Failure: {error in
            
        })
    }
    
    
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "LockeRoom")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

