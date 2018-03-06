//
//  TableViewCell.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 26..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class NoticeTableCell: UITableViewCell {

    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
