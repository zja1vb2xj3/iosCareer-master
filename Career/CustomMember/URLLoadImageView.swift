//
//  CustomImageView.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 21..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class URLLoadImageView: UIImageView {

    func loadURLImage(imageUrlStr : String)  {
        
        let imageURL: URL = URL(string: imageUrlStr)!
        
        if let image = UIImage(data: try! Data(contentsOf: imageURL)){
            
            
            self.image = image
        }
    }
}
