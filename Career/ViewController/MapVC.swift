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
        
        self.appDelegate.startScanning()
    
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.beaconOccur), name: Notification.Name(rawValue: Key.NotificationNameKey.beaconOccurNotification_Key) , object: nil)
    }
    
    @objc func beaconOccur(){
        
        showAlert()
    }
    
    func showAlert() {
        let alertManager = AlertManager()
        
        alertManager.createAlert(title: "비콘 반응 발생", message: "이동 버튼을 클릭하시면 상세페이지로 이동합니다.")
        
        //UIAlertActionStye.destructive 지정 글꼴 색상 변경
        let actionButton = UIAlertAction(title: "이동", style: UIAlertActionStyle.destructive){ (action: UIAlertAction) in
            self.moveToMainVC()
        }
        
        alertManager.addActionButton(actionButton: actionButton)
        
        self.present(alertManager.getAlertController(),animated: true,completion: nil)
    }
    
    func moveToMainVC() {
        let beaconOccurCompanyModels: [CompanyListModel] = self.appDelegate.beaconOccurCompanyListModels
        
        let companyTableVC = self.storyboard?.instantiateViewController(withIdentifier: "CompanyTableVC") as! CompanyTableVC
        companyTableVC.companyListModels = beaconOccurCompanyModels
        self.navigationController?.pushViewController(companyTableVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
