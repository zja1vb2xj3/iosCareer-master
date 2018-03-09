//
//  Recruitment_InfoVC.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 19..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class Recruitment_InfoVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var companyDetailModel: CompanyDetailModel!

    @IBOutlet weak var title1: PaddingLabel!
    @IBOutlet weak var title2: PaddingLabel!
    @IBOutlet weak var title3: PaddingLabel!
    @IBOutlet weak var title4: PaddingLabel!
    @IBOutlet weak var title5: PaddingLabel!
    @IBOutlet weak var title6: PaddingLabel!
    @IBOutlet weak var title7: PaddingLabel!
    @IBOutlet weak var title8: PaddingLabel!
    @IBOutlet weak var title9: PaddingLabel!
    @IBOutlet weak var title10: PaddingLabel!
    @IBOutlet weak var title11: PaddingLabel!
    
    @IBOutlet weak var content1: PaddingLabel!
    @IBOutlet weak var content2: PaddingLabel!
    @IBOutlet weak var content3: PaddingLabel!
    @IBOutlet weak var content4: PaddingLabel!
    @IBOutlet weak var content5: PaddingLabel!
    @IBOutlet weak var content6: PaddingLabel!
    @IBOutlet weak var content7: PaddingLabel!
    @IBOutlet weak var content8: PaddingLabel!
    @IBOutlet weak var content9: PaddingLabel!
    @IBOutlet weak var content10: PaddingLabel!
    @IBOutlet weak var content11: PaddingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.content1.text = companyDetailModel.recruitPart
        self.content2.text = companyDetailModel.jobDescription
        self.content3.text = companyDetailModel.career
        self.content4.text = companyDetailModel.recruitNumber
        self.content5.text = companyDetailModel.eligibility
        self.content6.text = companyDetailModel.workType
        self.content7.text = companyDetailModel.salary
        self.content8.text = companyDetailModel.workPlace
        self.content9.text = companyDetailModel.screening
        self.content10.text = companyDetailModel.submission
        self.content11.text = companyDetailModel.welfare
        
        //디바이스 세로사이즈 별로 텍스트 크기 조정
        
        print(self.view.frame.height)
        //아이폰  5s 568.0
        
        
        
    }
    
    func setTextSize(fontSize: CGFloat) {
        self.title1.font = self.title1.font.withSize(fontSize)
    }
    
    func setupView(){
        switch self.view.frame.height {
        case 480:
            print("3.5인치")
        default:
            print("")
        }
    }
    
    //폰모델
    //2g, 3g, 3gs, 4, 4s = 3.5 인치 320x480
    //5, 5s 5c, se = 4인치 320x568
    //6, 6s, 7, 8 = 4.7인치 375x667
    //6+, 6s+, 7+, 8+ = 5.5인치 414x736
    //X = 5.8인치 375x812
    override func viewDidAppear(_ animated: Bool) {

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
