//
//  CartDetailController.swift
//  FirstPro
//
//  Created by Tarun Meena on 16/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class CartDetailController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Customization()
    }
    
    func Customization() {
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(productSummary.nib, forCellReuseIdentifier: productSummary.identifier)
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.allowsMultipleSelection = false
        tableView?.allowsSelection = false
        
        backgroundView.layer.shadowOpacity = 0.7
        backgroundView.layer.shadowOffset = CGSize(width: 3, height: 3)
        backgroundView.layer.shadowRadius = 15.0
        backgroundView.layer.shadowColor = UIColor.black.cgColor
        
    }
    
    @IBAction func placeOrderAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "cart", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "CartController") as! CartController
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

extension CartDetailController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let simpleTableIdentifier = "customCell1"
            var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier) as? productSummary
            if(cell == nil) {
                let nib = Bundle.main.loadNibNamed("productSummary", owner: self, options: nil) as? [productSummary]
                cell = nib?[0]
                cell?.selectionStyle = .none
            }
            cell?.productName.text       = "Gledan G800 DryBlend T-Shirt"
            cell?.sizeLable.text         = "size"
            cell?.sizeMargin.text        = "M"
            cell?.priceLabel.text        = "$89.90"
            cell?.discountLabel.text     = "89.90"
            cell?.offerLabel.text        = "15% Off"
            cell?.deliveryDays.text      = "Delivery in 4-5 Days | "
            cell?.deliveryCharges.text   = "Free"
            cell?.productImage.image     = UIImage(named: "tshirt")
            cell?.wishlistImage.image    = UIImage(named: "wish")
            cell?.removeImage.image      = UIImage(named: "rem")
            cell?.wishlistButtonLabel.addTarget(self, action: #selector(addWishlist), for: .touchUpInside)
            cell?.removeButtonLabel.addTarget(self, action: #selector(removeItem), for: .touchUpInside)
            return cell!
            // add custom cell class for addTarget
        } else {
            let simpleTableIdentifier = "customCell2"
            var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier) as? productSummary
            if(cell == nil) {
                let nib = Bundle.main.loadNibNamed("productSummary", owner: self, options: nil) as? [productSummary]
                cell = nib?[1]
                cell?.selectionStyle = .none
            }
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 160
        } else {
            return 150
        }
    }
    
    @objc func addWishlist() {
        print("items added")
    }
    
    @objc func removeItem(){
        print("item removed")
    }
}
