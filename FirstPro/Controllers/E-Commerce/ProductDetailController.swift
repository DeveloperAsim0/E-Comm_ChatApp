//
//  ProductDetailController.swift
//  FirstPro
//
//  Created by Tarun Meena on 16/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class ProductDetailController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AddToCartAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "CartDetail", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "CartDetailController") as! CartDetailController
//        self.navigationController?.pushViewController(newViewController, animated: true)
        newViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @IBAction func BuyNowAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Payment", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "CartController") as! CartController
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

