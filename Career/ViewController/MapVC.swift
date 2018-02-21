//
//  MapViewController.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 12..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class MapVC: UIViewController {
    
    var rootViewHeight10Division : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootViewHeight10Division = self.view.frame.height / 10
        
//        initNavigationView()
//        initView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //전체 10
    //네비게이션 바 1.5
    //이미지뷰 6.5
    //저작권 2
    
    func initView() {
//        let customNavigationView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: rootViewHeight10Division*1.2))
//        customNavigationView.backgroundColor = UIColor.blue
//
//        let navigationWidth10Division = customNavigationView.frame.width / 10
//        let navigationHeight10Division = customNavigationView.frame.height / 10
//
//        let leftNavigationButton = UIButton(frame: CGRect(x: 0, y: navigationHeight10Division*2, width: navigationWidth10Division/2, height: customNavigationView.frame.height))
//        leftNavigationButton.backgroundColor = UIColor.black
//
//        customNavigationView.addSubview(leftNavigationButton)
        
//        let imageView = UIImageView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.size.height)!, width: self.view.frame.width, height: rootViewHeight10Division*9))
//        imageView.backgroundColor = UIColor.darkGray
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = UIImage(named: "home_icon.png")
//
//        let label = UILabel(frame: CGRect(x: 0, y: rootViewHeight10Division*9, width: self.view.frame.width, height: rootViewHeight10Division*1))
//        label.backgroundColor = UIColor.black
//        label.textColor = UIColor.white
//        label.text = "Copyright(c)career.co.kr All Right Reserved."
//        label.textAlignment = .center
//        label.font = label.font.withSize(11)
        
//        self.view.addSubview(customNavigationView)
//        self.view.addSubview(imageView)
//        self.view.addSubview(label)
    }
    
    func initNavigationView() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
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
