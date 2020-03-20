//
//  checkoutCell.swift
//  CheckoutXib
//
//  Created by Mihir Vyas on 13/01/20.
//  Copyright © 2020 Mihir Vyas. All rights reserved.
//

import UIKit

class checkoutCell: UITableViewCell {
    
    @IBOutlet weak var viewBackground       : UIView!
    @IBOutlet weak var firstAddress         : UIButton?
    @IBOutlet weak var firstcheckbutton     : UIButton?
    @IBOutlet weak var seconda              : UIButton?
    
    //checkout cell
    @IBOutlet weak var summaryLable         : UILabel?
    @IBOutlet weak var productName          : UILabel?
    @IBOutlet weak var sizeLable            : UILabel?
    @IBOutlet weak var sizeMargin           : UILabel?
    @IBOutlet weak var DeliveryDays         : UILabel?
    @IBOutlet weak var DeliveryCharges      : UILabel?
    @IBOutlet weak var priceLabel           : UILabel?
    @IBOutlet weak var priceAmount          : UILabel?
    @IBOutlet weak var deliveryFeeLabel     : UILabel?
    @IBOutlet weak var deliveryAmount       : UILabel?
    @IBOutlet weak var DiscountLabel        : UILabel?
    @IBOutlet weak var discountAmount       : UILabel?
    @IBOutlet weak var TotalLable           : UILabel?
    @IBOutlet weak var totalAmount          : UILabel?
    
    
    //Payment cell
    @IBOutlet weak var payImage             : UIImageView?
    @IBOutlet weak var paymentLabel         : UILabel?
    
    
    //Address cell
    @IBOutlet weak var addImage             : UIImageView?
    @IBOutlet weak var addImage2            : UIImageView?
    @IBOutlet weak var addressLabel         : UILabel?
    @IBOutlet weak var address1             : UILabel?
    @IBOutlet weak var address2             : UILabel?
    @IBOutlet weak var address1Change       : UIButton?
    @IBOutlet weak var address2Change       : UIButton?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      viewBackground?.layer.shadowOpacity   = 0.7
      viewBackground?.layer.shadowOffset    = CGSize(width: 3, height: 3)
      viewBackground?.layer.shadowRadius    = 15.0
      viewBackground?.layer.shadowColor     = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func firstcheckAction(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            firstAddress?.isSelected = false
            seconda?.isSelected = false
            
        } else {
            sender.isSelected = true
            firstAddress?.isSelected = false
            seconda?.isSelected = false
            
        }
    }
    
    
    @IBAction func addressAction(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            firstcheckbutton?.isSelected = false
            seconda?.isSelected = false
            
        } else {
            sender.isSelected = true
            firstcheckbutton?.isSelected = false
            seconda?.isSelected = false
            
        }
        
    }
    
    @IBAction func addressActionTwo(_ sender: UIButton) {
        
        if sender.isSelected {
            sender.isSelected = false
            firstcheckbutton?.isSelected = false 
            firstAddress?.isSelected = false
            
        } else {
            sender.isSelected = true
            firstAddress?.isSelected = false
            firstcheckbutton?.isSelected = false
            
        }
        
    }
    
    
}
