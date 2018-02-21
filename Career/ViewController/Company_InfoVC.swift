//
//  Company_InfoVC.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 19..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class Company_InfoVC: UIViewController, MTMapViewDelegate, MTMapReverseGeoCoderDelegate {
   
    @IBOutlet weak var contentsView: UIView!
    @IBOutlet weak var mapArea: UIView!
   
    var mapView : MTMapView?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
    override func viewDidAppear(_ animated: Bool) {
        self.mapView = MTMapView(frame: self.mapArea.frame)
        self.mapView?.delegate = self
        self.mapView?.baseMapType = .standard
        
        self.contentsView.addSubview(self.mapView!)
        
        let poiItems = createPoiItemToCompanyPosition(position: .init(latitude: 37.550250, longitude: 126.985576) , name: "ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ")
    
        if poiItems.count != 0 {
            self.mapView?.addPOIItems(poiItems)
            
            self.mapView?.setMapCenter(poiItems[0].mapPoint, animated: true)
            self.mapView?.setZoomLevel(1, animated: true)
            //        self.mapView?.isUserInteractionEnabled = false//지도움직임 제거
        }
    }
    
    func createPoiItemToCompanyPosition(position: MTMapPointGeo, name: String) -> [MTMapPOIItem] {
        var poiItems = [MTMapPOIItem]()
        
        let poiItem = MTMapPOIItem()

        poiItem.markerType = .customImage
        poiItem.customImage = UIImage(named: "map_pin_blue.png")
        
//        poiItem.markerSelectedType = .customImage
//        poiItem.customSelectedImage = UIImage(named: "map_pin_red.png")
//
        poiItem.mapPoint = MTMapPoint(geoCoord: position)
        poiItem.showAnimationType = .noAnimation
        
        //마커 벌룬 생성
        
        poiItems.append(poiItem)
        
        return poiItems
    }

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
