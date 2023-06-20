//
//  CustomeTableViewCell.swift
//  Tableview_Xib
//
//  Created by APPLE on 22/02/23.
//

import UIKit

class CustomeTableViewCell: UITableViewCell {

    
    @IBOutlet var aakashLabel: UILabel!
    
    @IBOutlet var pkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
