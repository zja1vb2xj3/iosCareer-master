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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    //비콘변수
    var locationManager: CLLocationManager?
    var tempBeaconID: String?
    //컨텐츠 변수
    //로딩때 받아오는 변수
    var beaconModels = [BeaconModel]()
    var companyListModels = [CompanyListModel]()//리스트모델
    //부스번호 키 companyModel이 값 dic
    var companyDic = [String : [CompanyModel]]()
    
    var beaconModelDic = [String: [BeaconModel]]()
    
    struct BeaconContentsTable {
        let TABLENAME: String = "TB_Beacon_Contents_Ko"
        let BCS_IDX: String = "BCS_IDX"
        let BCS_BOOTH_RANGE: String = "BCS_BOOTH_RANGE"
        let BCS_BEACON_ID: String = "BCS_BEACON_ID"
        let BCS_BEACON_MAJOR: String = "BCS_BEACON_MAJOR"
        let BCS_BEACON_MINOR: String = "BCS_BEACON_MINOR"
        let BCS_RSSI_COMPLEMENT: String = "BCS_RSSI_COMPLEMENT"
    }
    //비콘 데이터를 로딩때 받아올때 키는 비콘아이디 값은 부스범위
    //비콘이 반응됫을때 비콘 아이디로 부스범위를 찾는다
    //찾아진 부스 범위로 회사 데이터에 동일한 부스 범위를 검색해서 컨텐츠를 받아옴

    
    struct CompanyContentsTable {
        let TABLENAME: String = "TB_Company_Ko"
        let CPY_IDX: String = "CPY_IDX"
        let CPY_LOGO: String =  "CPY_LOGO"
        let CPY_TITLE: String = "CPY_TITLE"
        
        let CPY_RECRUIT_PART: String = "CPY_RECRUIT_PART"//모집부분
        let CPY_JOB_DESCRIPTION: String = "CPY_JOB_DESCRIPTION"//근무내용
        let CPY_CAREER: String = "CPY_CAREER"//경력사항
        let CPY_RECRUIT_NUM: String = "CPY_RECRUIT_NUM"//모집인원
        let CPY_ELIGIBILITY: String = "CPY_ELIGIBILITY"//자격요건
        let CPY_WORK_TYPE: String = "CPY_WORK_TYPE"//근무형태
        let CPY_SALARY: String = "CPY_SALARY"//급여
        let CPY_WORK_PLACE: String = "CPY_WORK_PLACE"//근무지
        let CPY_SCREENING: String = "CPY_SCREENING"//전형방법
        let CPY_SUBMISSION: String = "CPY_SUBMISSION"//제출서류
        let CPY_WELFARE: String = "CPY_WELFARE"//복리후생
        let CPY_CEO: String = "CPY_CEO"//대표자
        let CPY_PARTICIPATE: String = "CPY_PARTICIPATE"//참여지역
        let CPY_LOCATION: String = "CPY_LOCATION"//위치
        
        let CPY_HEAD_OFFICE: String = "CPY_HEAD_OFFICE"//본사/연구소
        let CPY_FACTORY: String = "CPY_FACTORY"//국내공장
        let CPY_PRODUCTS: String = "CPY_PRODUCTS"//주요생산품
        let CPY_EXP: String = "CPY_EXP"//회사소개
        let CPY_HOMEPAGE: String = "CPY_HOMEPAGE"//홈페이지
        let CPY_CONTACT_NUMBER: String = "CPY_CONTACT_NUMBER"//전화번호
    }
  
    
    func getBeaconContentsData(){
        let table = BeaconContentsTable()
        
        let query = PFQuery(className: table.TABLENAME)
        query.order(byAscending: table.BCS_IDX)
        
        query.findObjectsInBackground(block: {(objects: [PFObject]?, error:Error?) in
            if error == nil{
                for object in objects!{
                    let beaconModel = BeaconModel()
                    
                    beaconModel.range = object.object(forKey: table.BCS_BOOTH_RANGE) as! String
                    beaconModel.id = object.object(forKey: table.BCS_BEACON_ID) as! String
                    beaconModel.major = object.object(forKey: table.BCS_BEACON_MAJOR) as! String
                    beaconModel.minor = object.object(forKey: table.BCS_BEACON_MINOR) as! String
                    beaconModel.rssiCorrection = object.object(forKey: table.BCS_RSSI_COMPLEMENT) as! Int
                    
                    self.beaconModels.append(beaconModel)
                }//end for
            }//end check nil
           NotificationCenter.default.post(name: Notification.Name(rawValue: Key.NotificationNameKey.LoadSuccessNotification_Key) , object: nil)
        })
    }
    
    //리스트에 필요한 데이터를 로딩때 가져옴
    func getCompanyListData() {
        let table = CompanyContentsTable()
        
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

                    self.companyListModels.append(companyListModel)
                }//end for
            }//end check nil
            //파스에 접속이 끝나는 루프
            NotificationCenter.default.post(name: Notification.Name(rawValue: Key.NotificationNameKey.LoadSuccessNotification_Key) , object: nil)
        })
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        parseInit(launchOptions: launchOptions)
        beaconInit()
        
        return true
    }
    
    func beaconInit() {
        locationManager = CLLocationManager()
        self.locationManager?.delegate = self
        self.locationManager?.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
    
        let filteredBeacons = beacons.filter{ $0.proximity != CLProximity.unknown && $0.rssi <= -25 }
        
        if filteredBeacons.count > 0{
            for i: Int in 0 ..< filteredBeacons.count{
                if filteredBeacons[i].major == 1804{
                    
                    let major : String = filteredBeacons[i].major.stringValue
                    let minor : String = filteredBeacons[i].minor.stringValue
                    
                    let beaconId : String? = "m\(major)_\(minor)"
                    
                    let sign = deduplicationValue(beaconId: beaconId)
                    
                    if sign == false{
                        NotificationCenter.default.post(name: Notification.Name(rawValue: Key.NotificationNameKey.beaconOccurNotification_Key) , object: nil)
                    }
                    else{
                        continue
                    }
                    print(beaconId!)
                    print(sign)
                }
            }
        }
        else{
            print("beacon not find")
        }
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

