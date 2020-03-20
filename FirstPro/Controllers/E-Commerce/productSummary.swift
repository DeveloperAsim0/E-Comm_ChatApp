//
//  productSummary.swift
//  xibformat
//
//  Created by Tarun Meena on 10/01/20.
//  Copyright © 2020 Tarun Meena. All rights reserved.
//

import UIKit

class productSummary: UITableViewCell {

    // product Info
    @IBOutlet weak var productName          : UILabel!
    @IBOutlet weak var sizeLable            : UILabel!
    @IBOutlet weak var sizeMargin           : UILabel!
    @IBOutlet weak var priceLabel           : UILabel!
    @IBOutlet weak var discountLabel        : UILabel!
    @IBOutlet weak var offerLabel           : UILabel!
    @IBOutlet weak var deliveryDays         : UILabel!
    @IBOutlet weak var deliveryCharges      : UILabel!
    @IBOutlet weak var productImage         : UIImageView!
    @IBOutlet weak var wishlistImage        : UIImageView!
    @IBOutlet weak var removeImage          : UIImageView!
    @IBOutlet weak var wishlistButtonLabel  : UIButton!
    @IBOutlet weak var removeButtonLabel    : UIButton!
    

    // priceInfo
    @IBOutlet weak var priceDetails         : UILabel!
    @IBOutlet weak var priceItemLAbel       : UILabel!
    @IBOutlet weak var priceItemAmount      : UILabel!
    @IBOutlet weak var deliveryFee          : UILabel!
    @IBOutlet weak var deliveryFeeAmount    : UILabel!
    @IBOutlet weak var totalPayable         : UILabel!
    @IBOutlet weak var totalPayableAmount   : UILabel!
    @IBOutlet weak var saveLabel            : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
    
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    
}
