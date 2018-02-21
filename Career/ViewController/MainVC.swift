//
//  MainViewController.swift
//  Career
//
//  Created by Beaconyx on 2018. 2. 6..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var banner: UIImageView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        initSubView()
    }
    
    func initSubView() {
//        let subFrame = subView.frame
//
//        let subViewHeight10Division = subFrame.size.height / 10
//
//        let topButton = UIButton.init(frame: CGRect(x: 0, y: 0, width: subFrame.width, height: subViewHeight10Division*2))
//
//        topButton.backgroundColor = UIColor.blue //2
//        topButton.setTitle("비콘 서비스 실행중", for: .normal)
//
//
//        let button1 = UIButton.init(frame: CGRect(x: 0, y: subViewHeight10Division * 2+5, width: subFrame.width/2, height: subViewHeight10Division*3.9))
//        button1.backgroundColor = UIColor.green
//        button1.setTitle("중", for: .normal)
//
//        let button2 = UIButton.init(frame: CGRect(x: button1.frame.width+1, y: subViewHeight10Division * 2+5, width: subFrame.width/2, height: subViewHeight10Division*3.9))
//        button2.backgroundColor = UIColor.green
//        button2.setTitle("button2", for: .normal)
//
//
//        let button3 = UIButton.init(frame: CGRect(x: 0, y: button2.frame.origin.y + subViewHeight10Division*3.9+1, width: subFrame.width/2, height: subViewHeight10Division*3.9))
//        button3.backgroundColor = UIColor.green
//        button3.setTitle("button3", for: .normal)
//
//        let button4 = UIButton.init(frame: CGRect(x: button3.frame.width+1, y: button2.frame.origin.y + subViewHeight10Division*3.9+1, width: subFrame.width/2, height: subViewHeight10Division*3.9))
//        button4.backgroundColor = UIColor.green
//        button4.setTitle("button4", for: .normal)
//
//        topButton.addTarget(self, action: #selector(topButtonClicked), for: .touchDown)
//        button1.addTarget(self, action: #selector(button1Clicked), for: .touchDown)
//        button2.addTarget(self, action: #selector(button2Clicked), for: .touchDown)
//        button3.addTarget(self, action: #selector(button3Clicked), for: .touchDown)
//        button4.addTarget(self, action: #selector(button4Clicked), for: .touchDown)
//
//
//        subView.addSubview(topButton)
//        subView.addSubview(button1)
//        subView.addSubview(button2)
//        subView.addSubview(button3)
//        subView.addSubview(button4)

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
    

    
//    func initNavigationItem(){
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
//    }

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
