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
    }
    
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
