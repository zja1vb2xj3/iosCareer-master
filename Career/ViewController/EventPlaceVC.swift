//
//  EventPlaceVC.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 27..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class EventPlaceVC: UIViewController {

    @IBOutlet weak var placeSegmented: UISegmentedControl!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var mapImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mapImageView.image = UIImage(named: "fmap1.PNG")
        self.dayLabel.text = "4월 2일(월)"
        self.placeLabel.text = "서울 코엑스 C1~3홀"
    }
    @IBAction func changedPlaceSegmented(_ sender: UISegmentedControl) {
        let segment = sender
        
        switch segment.selectedSegmentIndex {
        case 0://서울
            //각 mapImageView image, dayLabel, placeLabel text 변경
            self.mapImageView.image = UIImage(named: "fmap1.PNG")
            self.dayLabel.text = "4월 2일(월)"
            self.placeLabel.text = "서울 코엑스 C1~3홀"
            break
        case 1://안산
            self.mapImageView.image = UIImage(named: "fmap1.PNG")
            self.dayLabel.text = "4월 12일(목)"
            self.placeLabel.text = "상록수 체육관"
            break
        case 2://울산
            self.mapImageView.image = UIImage(named: "fmap2.PNG")
            self.dayLabel.text = "4월 27일(금)"
            self.placeLabel.text = "울산 울산대학교 체육관"
            break
        case 3://광주
            self.mapImageView.image = UIImage(named: "fmap1.PNG")
            self.dayLabel.text = "5월 3일(목)"
            self.placeLabel.text = "김대중컨벤션센터"
            break
        case 4://대구
            self.mapImageView.image = UIImage(named: "fmap1.PNG")
            self.dayLabel.text = "5월 15일(화)"
            self.placeLabel.text = "엑스코"
            break
        case 5://창원
            self.mapImageView.image = UIImage(named: "fmap1.PNG")
            self.dayLabel.text = "5월 24일(목)"
            self.placeLabel.text = "컨벤션센터"
            break
        default:
            break
        }
    }
    
    @IBAction func moveToEnlargement(_ sender: UIButton) {
        let eventPlaceZoomVC: EventPlaceZoomVC! = self.storyboard?.instantiateViewController(withIdentifier: "EventPlaceZoomVC") as! EventPlaceZoomVC
        
        let placeName: String! = placeSegmented.titleForSegment(at: placeSegmented.selectedSegmentIndex)
        eventPlaceZoomVC.areaStr = placeName
        
        switch self.placeSegmented.selectedSegmentIndex {
        case 0:
            eventPlaceZoomVC.uiImage = UIImage(named: "fmap1.PNG")
            break
        case 1:
            eventPlaceZoomVC.uiImage = UIImage(named: "fmap1.PNG")
            break
        case 2://울산
            eventPlaceZoomVC.uiImage = UIImage(named: "fmap2.PNG")
            break
        case 3:
            eventPlaceZoomVC.uiImage = UIImage(named: "fmap1.PNG")
            break
        case 4:
            eventPlaceZoomVC.uiImage = UIImage(named: "fmap1.PNG")
            break
        case 5:
            eventPlaceZoomVC.uiImage = UIImage(named: "fmap1.PNG")
            break
        default:
            print("default")
        }
        
        self.navigationController?.pushViewController(eventPlaceZoomVC, animated: true)
        
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
