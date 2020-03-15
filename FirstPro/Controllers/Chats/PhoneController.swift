//
//  PhoneController.swift
//  FirstPro
//
//  Created by Tarun Meena on 04/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class PhoneController: UIViewController {

    let contactName = [("Alen Waker"),("Jimmy Joe"),("093748374"),("73849593"),("Mick"),("Warren"),("Klaus"),("Damon")]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var phoneBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPrivacySecurityNavBar()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    func setPrivacySecurityNavBar() {
        let gradient: CAGradientLayer = CAGradientLayer()
        let color1                     = UIColor(red: 255.0/255.0, green: 137.0/255.0, blue: 39.0/255.0, alpha: 1.0).cgColor
        let color2                     = UIColor(red: 255.0/255.0, green: 169.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        gradient.colors           = [color1, color2]
        var updatedFrame                   = self.phoneBackgroundView.bounds
        updatedFrame .size.height          += UIApplication.shared.statusBarFrame.size.height
        gradient.startPoint                = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint                  = CGPoint(x: 1.0, y: 0.0)
        gradient.frame                     = updatedFrame

        self.phoneBackgroundView.layer.insertSublayer(gradient, at: 0)
        //setBackgroundImage(image, for: UIBarMetrics.default)
    }
    
    
    
    @IBAction func videoCallAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "call", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "VideoCallController") as! VideoCallController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        
        print("pressed")
    }
    
    
    @IBAction func phoneCallAction(_ sender: Any) {
       let storyBoard: UIStoryboard = UIStoryboard(name: "call", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "VideoCallController") as! VideoCallController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        
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

extension PhoneController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! phoneTableViewCell
        
        cell.numberName.text = self.contactName[indexPath .row]
        return cell
    }
    
    
}


