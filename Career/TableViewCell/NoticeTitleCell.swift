//
//  NoticeCell.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 23..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class NoticeTitleCell: UITableViewCell {

    @IBOutlet weak var title: PaddingLabel!
    @IBOutlet weak var occurTime: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
