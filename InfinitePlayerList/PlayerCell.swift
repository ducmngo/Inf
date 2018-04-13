//
//  PlayerCell.swift
//  InfinitePlayerList
//
//  Created by Duc Minh Ngo on 2018-04-13.
//  Copyright © 2018 Duc Ngo. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell{
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var teamLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        ageLabel.adjustsFontForContentSizeCategory = true
        teamLabel.adjustsFontForContentSizeCategory = true
    }
}
