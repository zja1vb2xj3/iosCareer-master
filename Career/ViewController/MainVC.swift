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
    
    override func viewWillAppear(_ animated: Bool) {
        self.appDelegate.currentVCName = Key.BeaconOccurVCName.MainVC
//        self.appDelegate.startScanning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        self.appDelegate.stopScanning()
    }
    
    @IBAction func topButtonClick(_ sender: UIButton) {
        //서버에 오늘날짜 데이터가 없으면 추가

        checkTodayRegisterTopButtonClicked()
        //행사일 월일에 유저 아이디가 존재한다면 추가를 안함
    }
    
    func checkTodayRegisterTopButtonClicked(){
        print("checkTodayRegisterTopButtonClicked")
        let table = Key.StatisticsTableKey.self
        
        let query =  PFQuery(className: table.TABLENAME)
        
        //현재 월일에 해당 유저가 등록된 데이터가 있다면
        query.whereKey(table.USER_ID, equalTo: self.appDelegate.keyChainStr)
        query.whereKey(table.TIME, contains: TimeManager().getMonthOfDay())
        query.whereKey(table.CLICK_ENTER, equalTo: 1)
        
        query.findObjectsInBackground(block: {(objects: [PFObject]?, error:Error?) in
            if error == nil{
                if objects?.count == 0{//데이터가 없음
                    print("데이터가 존재하지 않습니다")
                    let pfObject = PFObject(className: table.TABLENAME)
                    pfObject[table.CLICK_ENTER] = 1
                    pfObject[table.TIME] = TimeManager().getCurrentTime()
                    pfObject[table.USER_ID] = self.appDelegate.keyChainStr
                    
                    pfObject.saveInBackground { (success:Bool, error:Error?) -> Void in
                        if (success) {//등록 성공
                            
                        }
                        else{
                            //실패
                        }
                    }
                }
                else{//데이터가 있음
                
                }
            }//end check nil
            //파스에 접속이 끝나는 루프
            self.moveToMapVC()
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
