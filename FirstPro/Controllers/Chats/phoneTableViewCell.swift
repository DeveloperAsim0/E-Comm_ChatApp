//
//  phoneTableViewCell.swift
//  FirstPro
//
//  Created by Tarun Meena on 16/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class phoneTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numberName: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var mobileLBL: UILabel!
    
    @IBOutlet weak var alert: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
