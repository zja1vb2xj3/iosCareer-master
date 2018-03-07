//
//  EventPlaceZoomVC.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 27..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class EventPlaceZoomVC: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var areaTitle: UILabel!
    @IBOutlet weak var zoomView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    var uiImage: UIImage!
    var areaStr: String!
    var imageURLStr: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //맵 핀치줌 구현
        self.zoomView.delegate = self
        self.zoomView.zoomScale = 1.0
        self.zoomView.maximumZoomScale = 4.0
        
        self.areaTitle.text = self.areaStr
        self.imageView.image = uiImage
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
