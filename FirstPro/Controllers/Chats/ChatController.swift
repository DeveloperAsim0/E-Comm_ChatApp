//
//  ChatController.swift
//  FirstPro
//
//  Created by Tarun Meena on 04/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class ChatController: UIViewController, ENSideMenuDelegate  {
    
    let gradientColor = Colors()
    
    var userNames = [("Laravel"),("Swift"),("Apple"),("Window"),("Android"),("Apple"),("Window"),("Android")]
    
    let userChatImages = [UIImage(named: "user1"), UIImage(named: "user2"), UIImage(named: "user3"), UIImage(named: "user4"), UIImage(named: "user5"), UIImage(named: "user6"), UIImage(named: "user7"), UIImage(named: "user8")]
    
    let userChatDetails = [("Now we will make connection between controls and ViewController.Swift code for that click on assistant button "),
                           ("Now we will make connection between controls and ViewController.Swift code for that click on assistant button"),
                           ("Now we will make connection between controls and ViewController.Swift code for that click on assistant button "),
                           ("Now we will make connection between controls and ViewController.Swift code for that click on assistant button "),
                           ("Now we will make connection between controls and ViewController.Swift code for that click on assistant button "),
                            ("Now we will make connection between controls and ViewController.Swift code for that click on assistant button "),
                                ("Now we will make connection between controls and ViewController.Swift code for that click on assistant button "),
                                        ("Now we will make connection between controls and ViewController.Swift code for that click on assistant button ")]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.sideMenuController()?.sideMenu?.delegate = self
         setPrivacySecurityNavBar()
         tableView.delegate = self
         tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setPrivacySecurityNavBar()
    }
    
    func setPrivacySecurityNavBar() {
        self.navigationItem.title              = "Chat"
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
        
//        let gradientLayer = CAGradientLayer()
//       // self.navigationController!.navigationBar.backgroundColor = UIColor.green
//        gradientLayer.frame = self.navigationController!.navigationBar.bounds
//        let color1 = UIColor(red: 255.0/255.0, green: 137.0/255.0, blue: 39.0/255.0, alpha: 1.0).cgColor as? CGColor
//        let color2 = UIColor(red: 255.0/255, green: 169.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor as? CGColor
//        gradientLayer.colors = [color1, color2]
//        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
//        self.navigationController!.navigationBar.layer.addSublayer(gradientLayer)
        
    }
    
//
    
    @IBAction func sideBarMenu(_ sender: UIBarButtonItem) {
        toggleSideMenuView()
        print("mihirvyas")
    }
    
    
    @IBAction func action(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "chatBackgroundController", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ChatBackgroundController") as! ChatBackgroundController
        newViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(newViewController, animated: true)
   }
    
    
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
         print("sideMenuShouldOpenSideMenu")
               return true
    }
    
    func sideMenuDidOpen() {
         print("sideMenuDidClose")
    }
    
    func sideMenuDidClose() {
         print("sideMenuDidOpen")
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

extension ChatController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! userTableViewCell

        cell.userName.text = self.userNames[indexPath .row]
        cell.userImage.image = self.userChatImages[indexPath .row]
        cell.userChatDetail.text = self.userChatDetails[indexPath.row]
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { _, _, complete in
            self.userNames.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            complete(true)
        }
        
        // here set your image and background color
        deleteAction.image = UIImage(named: "deletebin")
        deleteAction.backgroundColor = .orange
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
}

//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let deleteButton = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
//            self.tableView.dataSource?.tableView!(self.tableView, commit: .delete, forRowAt: indexPath)
//            return
//        }
//        return [deleteButton]
//     }
//
//        deleteButton.backgroundColor = UIColor.orange
//        return [deleteButton]
//
////         let color1  = UIColor(red: 255.0/255.0, green: 137.0/255.0, blue: 39.0/255.0, alpha: 1.0).cgColor
////         let color2 = UIColor(red: 255.0/255.0, green: 169.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
////        let cellColor = [color1, color2]
//
//    }



