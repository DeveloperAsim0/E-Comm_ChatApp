//
//  SettingController.swift
//  FirstPro
//
//  Created by Tarun Meena on 04/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class SettingController: UIViewController {
    
    let roundIconImage = [("Premium Calls"),("E-wallet & Free Package"),("Shop"),("Jobs"),("Invite to App")]
    
    let premiumNames = [UIImage(named: "icon1"), UIImage(named: "icon2"), UIImage(named: "icon3"), UIImage(named: "icon4"), UIImage(named: "icon5")]
    
    
    
    @IBOutlet weak var mainBackgroundView: UIView!
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        userImage.layer.borderWidth = 1.0
        userImage.layer.masksToBounds = false
        userImage.layer.borderColor = UIColor.white.cgColor
        userImage.layer.cornerRadius = userImage.frame.size.width / 2.0
        userImage.clipsToBounds = true
    }
    
    func backgroundView() {
        let gradient: CAGradientLayer = CAGradientLayer()

        let color1                     = UIColor(red: 255.0/255.0, green: 137.0/255.0, blue: 39.0/255.0, alpha: 1.0).cgColor
        let color2                     = UIColor(red: 255.0/255.0, green: 169.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        gradient.colors           = [color1, color2]
        var updatedFrame                   = self.mainBackgroundView.bounds
        updatedFrame .size.height          += UIApplication.shared.statusBarFrame.size.height
        gradient.startPoint                = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint                  = CGPoint(x: 1.0, y: 0.0)
        gradient.frame                     = updatedFrame

        self.mainBackgroundView.layer.insertSublayer(gradient, at: 0)
        //setBackgroundImage(image, for: UIBarMetrics.default)
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


extension SettingController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roundIconImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingTableViewCell
        
        cell.iconImageView.image = self.premiumNames[indexPath.row]
        cell.premiumCellLabel.text = self.roundIconImage[indexPath.row]
        return cell
    }
    
    
    
    
}
