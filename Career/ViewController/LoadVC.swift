//
//  ViewController.swift
//  Career
//
//  Created by Beaconyx on 2018. 2. 5..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class LoadVC: UIViewController {
   
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initNavigationItem()
        
        appDelegate.getBeaconContentsData()
        
        //서버에서 데이터를 받는 과정이 끝나면 메인화면으로 넘어감
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.moveToMainVC), name: Notification.Name(rawValue: "Beacon") , object: nil)
    }
    

    
    @objc func moveToMainVC() {
        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainVC
        self.navigationController?.pushViewController(mainVC, animated: true)
        
    }
    
    func initNavigationItem(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
  


}

