//
//  AppDelegate.swift
//  FirstPro
//
//  Created by Tarun Meena on 02/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import GoogleSignIn
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
     var sharedInstance = EditProfileControllerViewController()
     var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        // so in this example name is "Main".
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let storyboard2 = UIStoryboard.init(name: "signIn", bundle: nil)
        if UserDefaults.standard.value(forKey: "isLogin") != nil{
            //Navigate to homeviewcontroller
            let viewController = storyboard.instantiateViewController(withIdentifier: "CustomTabBarControllerViewController") as! CustomTabBarControllerViewController
            let navigationController = UINavigationController.init(rootViewController: viewController)
            self.window?.rootViewController = navigationController
        }else{
            let viewController = storyboard2.instantiateViewController(withIdentifier: "SignInController") as! SignInController
            let navigationController = UINavigationController.init(rootViewController: viewController)
            //Navigate to rootviewcontroller
            self.window?.rootViewController = navigationController
        }
        
        self.window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            
            if user.authentication != nil {
               let usermodel = UserModel(name: user.profile.name, email: user.profile.email, imageURL: user.profile.imageURL(withDimension: 200))
                self.sharedInstance.userModel = usermodel
            } else {
                print("module empty")
            }
            // [START_EXCLUDE silent]
            // [END_EXCLUDE]
            return
        }
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let facebookLog = ApplicationDelegate.shared.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        let googleLog = GIDSignIn.sharedInstance().handle(url, sourceApplication:[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,annotation: [:])
        return facebookLog || googleLog
    }
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
        -> Bool {
            return GIDSignIn.sharedInstance().handle(url,
                                                     sourceApplication:options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                                     annotation: [:])
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

