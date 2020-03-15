//
//  CartController.swift
//  FirstPro
//
//  Created by Mihir Vyas on 11/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class CartController: UIViewController {

    @IBOutlet weak var phonepeOutlet: UIButton?
    
    @IBOutlet weak var netbankingOutlet: UIButton?
    
    @IBOutlet weak var paytmOutlet: UIButton?
    
    @IBOutlet weak var codOutlet: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func PhonePeBtn(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            netbankingOutlet?.isSelected = false
            paytmOutlet?.isSelected = false
            codOutlet?.isSelected = false
        } else {
            sender.isSelected = true
           netbankingOutlet?.isSelected = false
           paytmOutlet?.isSelected = false
           codOutlet?.isSelected = false
        }
    }
    
    @IBAction func NetBankingBtn(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            phonepeOutlet?.isSelected = false
            paytmOutlet?.isSelected = false
            codOutlet?.isSelected = false
        } else {
            sender.isSelected = true
            phonepeOutlet?.isSelected = false
            paytmOutlet?.isSelected = false
            codOutlet?.isSelected = false
        }
    }
    
    @IBAction func PaytmBtn(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            netbankingOutlet?.isSelected = false
            phonepeOutlet?.isSelected = false
            codOutlet?.isSelected = false
        } else {
            sender.isSelected = true
            netbankingOutlet?.isSelected = false
            phonepeOutlet?.isSelected = false
            codOutlet?.isSelected = false
        }
    }
    
    @IBAction func CodBtn(_ sender: UIButton) {
       if sender.isSelected {
           sender.isSelected = false
           netbankingOutlet?.isSelected = false
           paytmOutlet?.isSelected = false
           phonepeOutlet?.isSelected = false
       } else {
           sender.isSelected = true
           netbankingOutlet?.isSelected = false
           paytmOutlet?.isSelected = false
           phonepeOutlet?.isSelected = false
       }
    }
    
    
    
    @IBAction func BuyNow(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "checkout", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "CheckoutController") as! CheckoutController
      //  self.navigationController?.pushViewController(newViewController, animated: true)
        newViewController.modalPresentationStyle = .fullScreen
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
