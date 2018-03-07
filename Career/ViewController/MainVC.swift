//
//  MainViewController.swift
//  Career
//
//  Created by Beaconyx on 2018. 2. 6..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit
import Parse

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
    
    @IBAction func topButtonClick(_ sender: UIButton) {
        //서버에 오늘날짜 데이터가 없으면 추가
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.timeZone = NSTimeZone.local
//        dateFormatter.dateFormat = "yyyy-MM-dd "
        
        let date = NSDate()
    
        let formatter = DateFormatter()
        
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateString = formatter.string(from: date as Date)
        
        print(dateString)
    }
    
    func checkTodayRegisterTopButtonClicked(){
        //오늘날짜에 해당 유저 아이디가 없다면 하면 정확할듯.?
        let table = Key.StatisticsTableKey.self
        
        let query =  PFQuery(className: table.TABLENAME)
        
        query.findObjectsInBackground(block: {(objects: [PFObject]?, error:Error?) in
            if error == nil{
                if objects?.count == 0{//데이터가 없음
                    let pfObject = PFObject(className: table.TABLENAME)
                    pfObject[table.CLICK_ENTER] = 1
//                    pfObject[table.TIME] =
                }
                else{//데이터가 있음
                    
                }
            }//end check nil
            //파스에 접속이 끝나는 루프
            
        })
    }
    
    func moveToMapVC(){
        let mapVC = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        self.navigationController?.pushViewController(mapVC, animated: true)
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
