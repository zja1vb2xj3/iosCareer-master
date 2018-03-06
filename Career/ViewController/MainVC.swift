//
//  MainViewController.swift
//  Career
//
//  Created by Beaconyx on 2018. 2. 6..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var banner: URLLoadImageView!

    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton1: UIButton!
    @IBOutlet weak var bottomButton2: UIButton!
    @IBOutlet weak var bottomButton3: UIButton!
    @IBOutlet weak var bottomButton4: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topButton.layer.borderWidth = 0.5
        topButton.layer.borderColor = UIColor.black.cgColor
    
        bottomButton1.layer.borderWidth = 0.5
        bottomButton1.layer.borderColor = UIColor.black.cgColor
        
        bottomButton2.layer.borderWidth = 0.5
        bottomButton2.layer.borderColor = UIColor.black.cgColor
        
        bottomButton3.layer.borderWidth = 0.5
        bottomButton3.layer.borderColor = UIColor.black.cgColor
        
        bottomButton4.layer.borderWidth = 0.5
        bottomButton4.layer.borderColor = UIColor.black.cgColor
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
       
    }
    
    func initSubView() {

//
//        topButton.addTarget(self, action: #selector(topButtonClicked), for: .touchDown)
//        button1.addTarget(self, action: #selector(button1Clicked), for: .touchDown)
//        button2.addTarget(self, action: #selector(button2Clicked), for: .touchDown)
//        button3.addTarget(self, action: #selector(button3Clicked), for: .touchDown)
//        button4.addTarget(self, action: #selector(button4Clicked), for: .touchDown)


    }
    
//    @objc func topButtonClicked(){
//        let mapVC = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
//        
//        self.navigationController?.pushViewController(mapVC, animated: true)
//    }
//    
//    @objc func button1Clicked(){
//        print("button1Clicked")
//    }
//    
//    @objc func button2Clicked(){
//        print("button2Clicked")
//    }
//    
//    @objc func button3Clicked(){
//        print("button3Clicked")
//    }
//    
//    @objc func button4Clicked(){
//        print("button4Clicked")
//    }
    


}
