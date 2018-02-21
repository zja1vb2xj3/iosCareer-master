//
//  AlertManager.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 21..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import Foundation

class AlertManager {
    private var alertController: UIAlertController!
    
    func createAlert(title: String, message: String){
        alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    func addActionButton(actionButton: UIAlertAction){
         let cancelButton = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel, handler: nil)
        alertController.addAction(actionButton)
        alertController.addAction(cancelButton)
    }
    
    func getAlertController() -> UIAlertController {
        return alertController
    }
}
