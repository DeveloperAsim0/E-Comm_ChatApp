//
//  ContactsController.swift
//  FirstPro
//
//  Created by Tarun Meena on 04/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class ContactsController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var contactBackgroundView: UIView!
    
    
    
       let userContactName = [("Laravel"),("Swift"),("Apple"),("Window"),("Android"),("Apple"),("Window"),("Android")]

       let userContactImage = [UIImage(named: "user1"), UIImage(named: "user2"), UIImage(named: "user3"), UIImage(named: "user4"), UIImage(named: "user5"), UIImage(named: "user6"), UIImage(named: "user7"), UIImage(named: "user8")]
       
       let userContactNumber = [("+9836452859"),("+6475832957"),("+638504955"),("+648949574"),("+648509589"),("+64758693"),("+764856960"),("+7584956858")]
       
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPrivacySecurityNavBar()
        backgroundView()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func backgroundView() {
        let gradient: CAGradientLayer = CAGradientLayer()
        var updatedFrame              = self.contactBackgroundView.bounds
        let color1                    = UIColor(red: 255.0/255.0, green: 137.0/255.0, blue: 39.0/255.0, alpha: 1.0).cgColor
        let color2                    = UIColor(red: 255.0/255.0, green: 169.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        gradient.colors               = [color1, color2]
        
        updatedFrame .size.height          += UIApplication.shared.statusBarFrame.size.height
        gradient.frame                     = updatedFrame
        gradient.startPoint                = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint                  = CGPoint(x: 1.0, y: 0.0)
       

           self.contactBackgroundView.layer.insertSublayer(gradient, at: 0)
           //setBackgroundImage(image, for: UIBarMetrics.default)
       }
    
    func setPrivacySecurityNavBar() {
        self.navigationItem.title      = "Contact"
        let gradientLayer              = CAGradientLayer()
        var updatedFrame               = self.navigationController!.navigationBar.bounds
        updatedFrame .size.height      += UIApplication.shared.statusBarFrame.size.height
        gradientLayer.frame            = updatedFrame
        let color1                     = UIColor(red: 255.0/255.0, green: 137.0/255.0, blue: 39.0/255.0, alpha: 1.0).cgColor
        let color2                     = UIColor(red: 255.0/255.0, green: 169.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        gradientLayer.colors           = [color1, color2]
        gradientLayer.startPoint       = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint         = CGPoint(x: 0.0, y: 0.0)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navigationController!.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
    }
    
    
    @IBAction func plusAction(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "productDetails", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "PhotoStreamViewController") as! PhotoStreamViewController
        newViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(newViewController, animated: true)
        
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


extension ContactsController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userContactName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! contactTableViewCell

        cell.userContact.text = self.userContactName[indexPath .row]
       // cell.userimageView.image = self.userContactImage[indexPath.row]
        cell.userNumber.text = self.userContactNumber[indexPath.row]
               return cell
    }
    
    
}


   
