//
//  RestaurantDetailCellTableViewCell.swift
//  ios10ch9
//
//  Created by heroshi on 2017/4/8.
//  Copyright © 2017年 heroshi. All rights reserved.
//

import UIKit

class RestaurantDetailCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
