//
//  SubEventTableCell.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 28..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class SubEventTableCell: UITableViewCell {

    @IBOutlet weak var loadImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
