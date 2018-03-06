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
    var mapView : MTMapView!
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
        self.mapView.delegate = self
        self.mapView.baseMapType = .standard
        
        self.contentsView.addSubview(self.mapView!)
        
        let poiItems = createPoiItemToCompanyPosition(position: self.companyDetailModel.location! , name: companyDetailModel.title)
        
        if poiItems.count != 0 {
            self.mapView?.addPOIItems(poiItems)
            
            self.mapView?.setMapCenter(poiItems[0].mapPoint, animated: true)
            self.mapView?.setZoomLevel(1, animated: true)
            self.mapView?.isUserInteractionEnabled = false//지도움직임 제거
            
            self.mapArea.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickMapArea)))
        }
    }
    
    
    @objc func clickMapArea(){
        let alertManager = AlertManager()
        
        alertManager.createAlert(title: "지도영역클릭", message: "이동 버튼 클릭 시 지도앱으로 이동합니다.")
        
        let actionButton = UIAlertAction(title: "이동", style: .destructive){ (action: UIAlertAction) in
            //다음 지도앱 작동
            UIApplication.shared.open(URL(string: "daummaps://look?p=\(self.companyDetailModel.location!.latitude),\(self.companyDetailModel.location!.longitude)")!, options: [:], completionHandler: nil)
        }
        
        alertManager.addActionButton(actionButton: actionButton)
        self.present(alertManager.getAlertController(), animated: true, completion: nil)
    }
    
    
//
//    func mapView(_ mapView: MTMapView!, dragStartedOn mapPoint: MTMapPoint!) {
//        print("지도화면 드래그")
//        let alert = AlertManager()
//
//
//
//        UIApplication.shared.open(URL(string: "daummaps://look?p=\(companyDetailModel.location!.latitude),\(companyDetailModel.location!.longitude)")!, options: [:], completionHandler: nil)
//    }
//
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
        print("홈페이지 버튼 클릭")
        
        let homePageStr = companyDetailModel.homePage
        
        if homePageStr != ""{
            UIApplication.shared.open(URL(string: "http://\(homePageStr!)")! , options: [:], completionHandler: nil)
        }
        else{
            //Alert 생성필요
            print("홈페이지 가 존재하지 않음.")
        }
    }
    
    @IBAction func callButtonClick(_ sender: UIButton) {
        print("전화하기 버튼 클릭")
        let numberStr = companyDetailModel.contactNumber
        //number값이 존재한다면
        if numberStr != ""{
            print("값이 존재")
            if let url = URL(string: "tel://\((numberStr!))"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
            else{
                //Alert 생성필요
                print("번호가 존재하지 않음.")
            }
        }
    }
 
}//end VC
