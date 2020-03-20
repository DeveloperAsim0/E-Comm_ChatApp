//
//  CheckoutController.swift
//  FirstPro
//
//  Created by Mihir Vyas on 15/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class CheckoutController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customization()
        // Do any additional setup after loading the view.
    }
    
    func customization() {
    tableView?.estimatedRowHeight       = 100
    tableView?.rowHeight                = UITableView.automaticDimension
    tableView?.allowsMultipleSelection  = false
    tableView?.allowsSelection          = false
    
    backgroundView.layer.shadowOpacity  = 0.7
    backgroundView.layer.shadowOffset   = CGSize(width: 3, height: 3)
    backgroundView.layer.shadowRadius   = 15.0
    backgroundView.layer.shadowColor    = UIColor.black.cgColor

    }
    
    @IBAction func continueAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "orderCompleted", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "OrderCompleteViewController") as! OrderCompleteViewController
       // self.navigationController?.pushViewController(newViewController, animated: true)
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

extension CheckoutController: UITableViewDelegate, UITableViewDataSource {
    
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
            let simpleTableIdentifier = "CheckoutCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier) as? checkoutCell
            if(cell == nil) {
                let nib = Bundle.main.loadNibNamed("checkoutCell", owner: self, options: nil) as? [checkoutCell]
                cell = nib?[0]
                cell?.selectionStyle = .none
            }
            cell?.summaryLable?.text     = "Summary"
            cell?.productName?.text      = "Gliden G800 DryBlend T-Shirt"
            cell?.sizeLable?.text        = "Size"
            cell?.sizeMargin?.text       = "M"
            cell?.DeliveryDays?.text     = "Delivery between 4-5 Days| "
            cell?.DeliveryCharges?.text  = "Free"
            cell?.priceLabel?.text       = "Price(1 item)"
            cell?.priceAmount?.text      = "$179.90"
            cell?.deliveryFeeLabel?.text = "Delivery Fee"
            cell?.deliveryAmount?.text   = "Free"
            cell?.DiscountLabel?.text    = "89.90"
            cell?.discountAmount?.text   = "15% Off"
            cell?.TotalLable?.text       = "Total"
            cell?.totalAmount?.text      = "199.90"
            return cell!
        } else {
            let simpleTableIdentifier = ""
            var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier) as? checkoutCell
            if(cell == nil) {
                let nib = Bundle.main.loadNibNamed("checkoutCell", owner: self, options: nil) as? [checkoutCell]
                cell = nib?[1]
                cell?.selectionStyle = .none
            }
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 170
        } else {
            return 50
        }
    }
}

