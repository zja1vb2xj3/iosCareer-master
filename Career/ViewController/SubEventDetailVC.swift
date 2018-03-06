//
//  SubEventDetailVC.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 28..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class SubEventDetailVC: UIViewController {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    
    var uiImage: UIImage!
    var titleStr: String!
    var contentStr: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        img.image = uiImage
        titleLabel.text = titleStr
        contentTextView.text = contentStr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
