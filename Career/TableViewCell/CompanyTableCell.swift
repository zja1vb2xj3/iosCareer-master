//
//  BeaconEventCell.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 19..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class CompanyTableCell: UITableViewCell {
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var logo: URLLoadImageView!
    @IBOutlet weak var title: UITextView!
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
