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
   
    @IBOutlet weak var logo: URLLoadImageView!
    var mapView : MTMapView?
    @IBOutlet weak var content1: PaddingLabel!
    @IBOutlet weak var content2: PaddingLabel!
    @IBOutlet weak var content3: PaddingLabel!
    @IBOutlet weak var content4: PaddingLabel!
    @IBOutlet weak var content5: PaddingLabel!
    @IBOutlet weak var content6: PaddingLabel!
    
    var companyDetailModel: CompanyDetailModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logo.loadURLImage(imageUrlStr: companyDetailModel.imageURLStr)
        self.content1.text = companyDetailModel.ceoName
        self.content2.text = companyDetailModel.participate
        self.content3.text = companyDetailModel.headOffice
        self.content4.text = companyDetailModel.inFactory
        self.content5.text = companyDetailModel.products
        self.content6.text = companyDetailModel.exp
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.mapView = MTMapView(frame: self.mapArea.frame)
        self.mapView?.delegate = self
        self.mapView?.baseMapType = .standard
        
        self.contentsView.addSubview(self.mapView!)
        
        let poiItems = createPoiItemToCompanyPosition(position: self.companyDetailModel.location! , name: companyDetailModel.title)
        
        if poiItems.count != 0 {
            self.mapView?.addPOIItems(poiItems)
            
            self.mapView?.setMapCenter(poiItems[0].mapPoint, animated: true)
            self.mapView?.setZoomLevel(1, animated: true)
            self.mapView?.isUserInteractionEnabled = false//지도움직임 제거
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
    
    @IBAction func homePageButtonClick(_ sender: UIButton) {
    }
    
    @IBAction func callButtonClick(_ sender: UIButton) {
        
    }

}
