//
//  AppDelegate.swift
//  Career
//
//  Created by Beaconyx on 2018. 2. 5..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit
import CoreLocation
import Parse
import Firebase
import AudioToolbox

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    //비콘변수
    var locationManager: CLLocationManager?
    var tempBeaconID: String?
    //컨텐츠 변수
    //로딩때 받아오는 변수
    var beaconModelDic = [String : BeaconModel]()
    var companyListModelDic = [Int: CompanyListModel]()
    
    var companyListModels = [CompanyListModel]()//리스트 클릭시 모델
    
    var keyChainStr: String!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let keyChain = KeychainItemWrapper()
        self.keyChainStr = keyChain.getBDA()
        
        parseInit(launchOptions: launchOptions)
        
        beaconInit()
        
        FirebaseApp.configure()
        
        return true
    }

    
    //로딩때 비콘 컨텐츠를 가져오는 함수
    func getBeaconContentsData(){
        let table = Key.BeaconContentsTableKey.self
        
        let query = PFQuery(className: table.TABLENAME)
        query.order(byAscending: table.BCS_IDX)
        
        query.findObjectsInBackground(block: {(objects: [PFObject]?, error:Error?) in
            if error == nil{
                for object in objects!{
                    let beaconModel = BeaconModel()
                    
                    let boothRange = object.object(forKey: table.BCS_BOOTH_RANGE) as! String
                    
                    if boothRange != Key.undefined{
                        beaconModel.range = object.object(forKey: table.BCS_BOOTH_RANGE) as! String
                        beaconModel.id = object.object(forKey: table.BCS_BEACON_ID) as! String
                        beaconModel.major = object.object(forKey: table.BCS_BEACON_MAJOR) as! String
                        beaconModel.minor = object.object(forKey: table.BCS_BEACON_MINOR) as! String
                        beaconModel.rssiCorrection = object.object(forKey: table.BCS_RSSI_COMPLEMENT) as! Int
                        
                        self.beaconModelDic[beaconModel.id] = beaconModel
                        print("beaconId",beaconModel.id)
                    }
                }//end for
            }//end check nil
            self.getCompanyListData()
        })
    }
    
    //리스트에 필요한 데이터를 로딩때 가져옴
    func getCompanyListData() {
        let table = Key.CompanyContentsTableKey.self
        
        let query = PFQuery(className: table.TABLENAME)
        query.order(byAscending: table.CPY_IDX)
        
        query.findObjectsInBackground(block: {(objects: [PFObject]?, error:Error?) in
            if error == nil{
                for object in objects!{
                    let companyListModel = CompanyListModel()
                    
                    let idx = object.object(forKey: table.CPY_IDX) as! Int
                    let  boothNumber: String = "0" + String(idx)
                    
                    companyListModel.boothNumber = boothNumber
                    companyListModel.imageURLStr = object.object(forKey: table.CPY_LOGO) as! String
                    companyListModel.title = object.object(forKey: table.CPY_TITLE) as! String
                    companyListModel.recruitPart = object.object(forKey: table.CPY_RECRUIT_PART) as! String
                
                    /*
                     *비콘 반응시 데이터를 가져올 dic
                     *key idx == booth number
                     */
                    print("loadDic Idx", idx)
                    self.companyListModelDic[idx] = companyListModel
                    
                    self.companyListModels.append(companyListModel)//searchCompanyTableVC에서 사용
                }//end for
            }//end check nil
            //파스에 접속이 끝나는 루프
            NotificationCenter.default.post(name: Notification.Name(rawValue: Key.NotificationNameKey.loadSuccessNotification_Key) , object: nil)
        })
    }
    
    func beaconInit() {
        locationManager = CLLocationManager()
        self.locationManager?.delegate = self
        self.locationManager?.requestWhenInUseAuthorization()
    }
    
    //companyListDic의 결과 companyModel들을 담을 array생성
    
    //
    var beaconOccurCompanyListModels: [CompanyListModel] = []
    var currentVCName: String!
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
        let filteredBeacons = beacons.filter{ $0.proximity != CLProximity.unknown && $0.rssi <= -25 }
        
        if filteredBeacons.count > 0{
            print("비콘반응 VC:", self.currentVCName)
            
            for i: Int in 0 ..< filteredBeacons.count{
                if filteredBeacons[i].major == 1804{
                    
                    let major : String! = filteredBeacons[i].major.stringValue
                    let minor : String! = filteredBeacons[i].minor.stringValue
                    
                    let beaconId : String! = "m" + major + "_" + minor//비콘아이디생성
                    
                    let sign = deduplicationValue(beaconId: beaconId)//중복제거 신호
                    
                    if sign == false{
                        print("중복이 아님")
                        
                        switch(self.currentVCName){
                        case Key.BeaconOccurVCName.MainVC:
                            if beaconId == Key.SpacialBeaconId.SPECIAL_LECTURE_BEACONID{
                                checkTodayRegisterEnterBeacon(beaconId: beaconId)
                            }
                            break
                        case Key.BeaconOccurVCName.MapVC:
                            if beaconId == Key.SpacialBeaconId.SPECIAL_LECTURE_BEACONID{
                                checkTodayRegisterEnterBeacon(beaconId: beaconId)
                            }
                            //취업특별관 비콘 아이디가 아닐경우 조건을 걸어야할지
                            createBeaconOccurCompanyListModels(beaconId: beaconId)
                            break
                        default:
                            break
                        }
                    }//end sign false
                    else{
                        print("중복임")
                    }
                    
                    print(beaconId!)
                }
            }
        }
        else{
            print("beacon not find")
        }
    }
    
    
    func checkTodayRegisterEnterBeacon(beaconId: String){//입장 비콘 체크
        let table = Key.StatisticsTableKey.self
        
        let query =  PFQuery(className: table.TABLENAME)
        
        query.whereKey(table.USER_ID, equalTo: self.keyChainStr)
        query.whereKey(table.TIME, contains: TimeManager().getMonthOfDay())
        query.whereKey(table.BEACON_ID, equalTo: beaconId)
        
        query.findObjectsInBackground(block: {(objects: [PFObject]?, error:Error?) in
            if error == nil{
                if objects?.count == 0{//데이터가 없음
                    print("등록된 enter 비콘이 없음")
                    let pfObject = PFObject(className: table.TABLENAME)
                    pfObject[table.BEACON_ID] = "m1804_1000"
                    pfObject[table.TIME] = TimeManager().getCurrentTime()
                    pfObject[table.USER_ID] = self.keyChainStr
                    
                    pfObject.saveInBackground { (success:Bool, error:Error?) -> Void in
                        if (success) {//등록 성공
                            
                        }
                        else{
                            //실패
                        }
                    }
                    //데이터가 없다면 서버에 등록 후 main과
                }//end 데이터가 없음
                else{//데이터가 있음
                    print("등록된 enter 비콘이 있음")
                }
            }//end check nil
            //파스에 접속이 끝나는 루프
           
        })
    }
    
    
    func createBeaconOccurCompanyListModels(beaconId: String){
        print("beaconId: \(beaconId)")
        let beaconModel: BeaconModel = self.beaconModelDic[beaconId]!
        
        let rangeArr: [String] = self.separationStr(value: beaconModel.range, separatedBy: "~")
        
        //비콘 반응시 rangeArr[0] ~ rangeArr[1] int로 변환하여 반복문 사용
        
        let startValue : Int = Int(rangeArr[0])!
        let endValue : Int = Int(rangeArr[1])!
        print(startValue)
        print(endValue)
        self.beaconOccurCompanyListModels = []//초기화
        
        for  i in startValue ... 5 {//실제론 end로 해야됨
            print("count: \(i)")
            let companyListModel: CompanyListModel = self.companyListModelDic[i]!
            print("recruitPart:\(companyListModel.recruitPart)")
            self.beaconOccurCompanyListModels.append(companyListModel)
        }
        NotificationCenter.default.post(name: Notification.Name(rawValue: Key.NotificationNameKey.beaconOccurNotification_Key) , object: nil)
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    //문자열 separatedBy 기준 분할
    func separationStr(value: String, separatedBy: String)-> [String]{
        let valueArr: [String] = value.components(separatedBy: separatedBy)
        
        return valueArr
    }
    
    //중복제거
    func deduplicationValue(beaconId: String?) -> Bool  {
        var sign : Bool?
        
        if self.tempBeaconID != beaconId{
            sign = false
            self.tempBeaconID = beaconId
        }
        else{
            sign = true
        }
        
        return sign!
    }
    
    func startScanning() {
        let uuid = UUID(uuidString: "a0fabefc-b1f5-4836-8328-7c5412fff9c4")
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid!, identifier: "")
        
        self.locationManager?.requestWhenInUseAuthorization()
        self.locationManager!.startRangingBeacons(in: beaconRegion)
    }
    
    func stopScanning(){
        let uuid = UUID(uuidString: "a0fabefc-b1f5-4836-8328-7c5412fff9c4")
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid!, identifier: "")
        
        self.locationManager?.requestWhenInUseAuthorization()
        self.locationManager?.stopRangingBeacons(in: beaconRegion)
    }
    
    func parseInit(launchOptions : [UIApplicationLaunchOptionsKey : Any]?) {
        Parse.enableLocalDatastore()
        let configuration = ParseClientConfiguration{
            $0.applicationId = "CareerbeaconyxaAZx4r86ekoyIwwGfdfOLeT2CnQKFcQ1"
            $0.clientKey = "CareerbeaconyxSkvy38GBFH6i1MZ2JGxfYkt2j4gaRoKxy"
            $0.server = "http://www.beaconyx.co.kr:1337/parse"
        }
        
        Parse.initialize(with: configuration)
        PFAnalytics.trackAppOpened(launchOptions: launchOptions)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
//        self.saveContext()
    }

 

}

