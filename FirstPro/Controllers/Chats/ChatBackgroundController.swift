//
//  ChatBackgroundController.swift
//  FirstPro
//
//  Created by Tarun Meena on 16/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class ChatBackgroundController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    @IBAction func dataUsageAction(_ sender: Any) {
        
    }
    
    @IBAction func chatBackgroundAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "jobPortalController", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "JobPortalController") as! JobPortalController
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
     @IBAction func textSizeAciton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "EditProfile", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "EditProfileControllerViewController") as! EditProfileControllerViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
     }
    
    @IBAction func privacySecurityAciton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "wallet", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "WalletController") as! WalletController
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    
    @IBAction func chatLanguageAction(_ sender: Any) {
        
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
