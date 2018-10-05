//
//  AccountTableViewCell.swift
//  AccountManager
//
//  Created by Shiromu on 2018/10/05.
//  Copyright © 2018年 Shiromu. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    
    @IBOutlet weak var accountImageView: UIImageView!
    @IBOutlet weak var accountNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
