//
//  ViewController.swift
//  Career
//
//  Created by Beaconyx on 2018. 2. 5..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit
import Parse

class LoadVC: UIViewController {
   
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initNavigationItem()
        
        checkRegisterUser()
    
    
    }

    func loadParseData(){
        self.appDelegate.getBeaconContentsData()//로딩 데이터를 받음
        //서버에서 데이터를 받는 과정이 끝나면 메인화면으로 넘어감
        NotificationCenter.default.addObserver(self, selector: #selector(self.moveToMainVC), name: Notification.Name(rawValue: Key.NotificationNameKey.loadSuccessNotification_Key) , object: nil)
    }
    
    func checkRegisterUser(){
        //서버에 해당 키체인이 있는지 확인 없으면 등록
        let table = Key.AccountTableKey.self
        
        let query = PFQuery(className: table.TABLENAME)
        
        query.whereKey(table.ACT_USER_ID, equalTo: appDelegate.keyChainStr)
        
        query.findObjectsInBackground(block: {(objects: [PFObject]?, error:Error?) in
            if error == nil{
                if objects?.count == 0{
                    //데이터가 없음
                    //등록하라는 다이얼로그를 만들고 등록을 하면 로딩진행 등록을 안하면 앱종료
                    print("없음")
                    let alertManager = AlertManager()
                    alertManager.createAlert(title: "커리어 앱을 사용하시려면 유저 등록을 하셔야 합니다.", message: "아래와 같은 권한을 요구합니다. \n1)블루투스 사용요구, 2)향상된 서비스 제공을 위해 사용자 단말기 모델, 제조사 정보, 임의로 생성된 아이디 수집(개인정보 수집 x), 3)GPS 사용요구, 4)진동, 알림, 5)인터넷 사용")
                    
                    let actionButton = UIAlertAction(title: "등록", style: UIAlertActionStyle.destructive){ (action: UIAlertAction) in
                        let pfObject = PFObject(className: table.TABLENAME)
                        pfObject[table.ACT_USER_ID] = self.appDelegate.keyChainStr
                        pfObject[table.ACT_USER_PHONE_MODEL] = UIDevice.current.modelName
                        pfObject[table.ACT_USER_OS] = UIDevice.current.systemName
                        pfObject[table.ACT_USER_OS_VERSION] = UIDevice.current.systemVersion
                        
                        pfObject.saveInBackground { (success:Bool, error:Error?) -> Void in
                            if (success) {//등록 성공
                                self.loadParseData()
                            }
                            else{
                                //등록실패
                                let alertManager = AlertManager()
                                alertManager.createAlert(title: "알림", message: "등록이 실패하였습니다. 관리자에게 문의하세요")
                                alertManager.addSuccessButton()
                                self.present(alertManager.getAlertController(), animated: true, completion: nil)
                            }
                        }
                    }
                    
                    let closeButton = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel){ (action: UIAlertAction) in
                        exit(0)
                    }
                
                    alertManager.addCloseAppActionButton(actionButton: actionButton, closeButton: closeButton)
                    
                    self.present(alertManager.getAlertController(), animated: true, completion: nil)
                
                }
                else{
                    print("데이터가 있음")
                    self.loadParseData()
                }
                
            }//end check nil
            //파스에 접속이 끝나는 루프
         
        })
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

 extension UIDevice {
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 , value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
        case "AppleTV5,3":                              return "Apple TV"
        case "AppleTV6,2":                              return "Apple TV 4K"
        case "AudioAccessory1,1":                       return "HomePod"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
}

