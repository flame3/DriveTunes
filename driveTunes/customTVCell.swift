//
//  customCellTV.swift
//  driveTunes
//
//  Created by nic on 31/1/2017.
//  Copyright © 2017 nicksdev. All rights reserved.
//

import UIKit

class customTVCell: UITableViewCell {
    
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
