//
//  NoticeOccurTimeLabel.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 26..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class NoticeOccurTimeLabel: UILabel {

    var topInset: CGFloat = 0
    var bottomInset: CGFloat = 0
    var leftInset: CGFloat = 0
    var rightInset: CGFloat = 10
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 0
        self.font = self.font.withSize(11)

        self.setNeedsLayout()
        return super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
}
