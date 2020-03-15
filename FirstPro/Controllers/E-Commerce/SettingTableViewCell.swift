//
//  SettingTableViewCell.swift
//  FirstPro
//
//  Created by Tarun Meena on 16/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var touch: UIButton!
    @IBOutlet weak var premiumCellLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBAction func touchBtn(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
