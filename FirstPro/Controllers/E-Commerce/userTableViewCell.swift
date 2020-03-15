//
//  userTableViewCell.swift
//  FirstPro
//
//  Created by Mihir Vyas on 15/12/19.
//  Copyright © 2019 Tarun Meena. All rights reserved.
//

import UIKit

class userTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userChatDetail: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
