//
//  MapViewController.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 12..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class MapVC: UIViewController {
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate.startScanning()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initView() {

    }
   


}
