//
//  CustomTabBarControllerViewController.swift
//  
//
//  Created by Mihir Vyas on 17/12/19.
//

import UIKit

class CustomTabBarControllerViewController: UITabBarController,  UITabBarControllerDelegate {

       var chatViewController: ChatController!
       var contactViewController: ContactsController!
       var settingViewController: SettingController!
       var phoneViewController: PhoneController!
       
       
       override func viewDidLoad() {
           super.viewDidLoad()
           self.delegate = self 
           chatViewController    = ChatController()
           contactViewController = ContactsController()
           settingViewController = SettingController()
           phoneViewController   = PhoneController()
        
       }
       
       
       func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
         if viewController.isKind(of: ChatController.self) {
            let vc =  ChatController()
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
            return false
         }
         return true
       }
       

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
