//
//  PaddingLabel.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 21..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class PaddingLabel: UILabel {

    var topInset: CGFloat = 5
    var bottomInset: CGFloat = 5
    var leftInset: CGFloat = 5
    var rightInset: CGFloat = 0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        self.setNeedsLayout()
        
        self.layer.borderWidth = 0.5
        let borderColor = UIColor(displayP3Red: 189/255, green: 189/255, blue: 189/255, alpha: 1)
        self.layer.borderColor = borderColor.cgColor
        return super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }

}
