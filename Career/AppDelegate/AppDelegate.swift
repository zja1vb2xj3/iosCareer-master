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
    var beaconModels = [BeaconModel]()
    var companyDic = [String : [CompanyModel]]()
    
    //부스번호 키 companyModel이 값 dic
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

    
//    struct CompanyContentsTable {
//        <#fields#>
//    }
  
    
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
           NotificationCenter.default.post(name: Notification.Name(rawValue: "Beacon") , object: nil)
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
                        //중복이 아님
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

    // MARK: - Core Data stack

//    lazy var persistentContainer: NSPersistentContainer = {
//        /*
//         The persistent container for the application. This implementation
//         creates and returns a container, having loaded the store for the
//         application to it. This property is optional since there are legitimate
//         error conditions that could cause the creation of the store to fail.
//        */
//        let container = NSPersistentContainer(name: "Career")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//
//                /*
//                 Typical reasons for an error here include:
//                 * The parent directory does not exist, cannot be created, or disallows writing.
//                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                 * The device is out of space.
//                 * The store could not be migrated to the current model version.
//                 Check the error message to determine what the actual problem was.
//                 */
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()

    // MARK: - Core Data Saving support

//    func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }

}

