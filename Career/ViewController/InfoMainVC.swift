//
//  CompanyInfoMainVC.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 19..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//


//폰모델
//2g, 3g, 3gs, 4, 4s = 3.5 인치 320x480
//5, 5s 5c, se = 4인치 320x568
//6, 6s, 7, 8 = 4.7인치 375x667
//6+, 6s+, 7+, 8+ = 5.5인치 414x736
//X = 5.8인치 375x812

import UIKit

class InfoMainVC: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var companyTitle: UILabel!
    @IBOutlet weak var recruitment_Info_Button: UIButton!
    @IBOutlet weak var company_Info_Button: UIButton!
    
    @IBOutlet weak var subView: UIView!
    
    var companyDetailModel: CompanyDetailModel!
    
    var vcIndex = 0
    
    let tabSelectedBGColor: UIColor! =  UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    let tabUnSelectedBGColor: UIColor! = UIColor(red: 9/255, green: 88/255, blue: 173/255, alpha: 1)
    
    let tabSelectedTextColor: UIColor! = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    let tabUnSelectedTextColor: UIColor! = UIColor(red: 74/255, green: 128/255, blue: 181/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        NotificationCenter.default.removeObserver(self)
        self.companyTitle.text = self.companyDetailModel.title
    
        recruitment_Info_Button.addTarget(self, action: #selector(recruitment_Info_ButtonClick), for: .touchDown)
        company_Info_Button.addTarget(self, action: #selector(company_Info_ButtonClick), for: .touchDown)
        
        updateSelfView(buttonindex: 0)
        
        print("infoMainVC")
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func recruitment_Info_ButtonClick(){
        let buttonIndex = 0
        
        updateSelfView(buttonindex: buttonIndex)
    }
    
    @objc func company_Info_ButtonClick(){
        let buttonIndex = 1
        
        updateSelfView(buttonindex: buttonIndex)
    }
    
    private func updateSelfView(buttonindex : Int){
        print(buttonindex)
        
        if buttonindex == 0 {
            self.recruitment_Info_Button.backgroundColor = self.tabSelectedBGColor
            self.recruitment_Info_Button.titleLabel?.textColor = self.tabSelectedTextColor
            self.recruitment_Info_Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            
            self.company_Info_Button.backgroundColor = self.tabUnSelectedBGColor
            self.company_Info_Button.titleLabel?.textColor = self.tabUnSelectedTextColor
            self.company_Info_Button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
            
            removeChildView(asChildViewController: company_InfoVC)
            add(asChildViewController: recruitment_InfoVC)
        }
        else if buttonindex == 1{
            self.recruitment_Info_Button.backgroundColor = self.tabUnSelectedBGColor
            self.recruitment_Info_Button.titleLabel?.textColor = self.tabUnSelectedTextColor
            self.recruitment_Info_Button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
            
            self.company_Info_Button.backgroundColor = self.tabSelectedBGColor
            self.company_Info_Button.titleLabel?.textColor = self.tabSelectedTextColor
            self.company_Info_Button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            
            removeChildView(asChildViewController: recruitment_InfoVC)
            add(asChildViewController: company_InfoVC)
        }
    
    }
    
    private func removeChildView(asChildViewController viewController : UIViewController){
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }
    
    private func add(asChildViewController viewController: UIViewController){
        addChildViewController(viewController)
        self.subView.addSubview(viewController.view)
        
        viewController.view.frame = self.subView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        viewController.didMove(toParentViewController: self)
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    @IBAction func backButtonClick(_ sender: UIButton) {
        if vcIndex == 0{
            let beaconCompanyTableVC = self.storyboard?.instantiateViewController(withIdentifier: "BeaconCompanyTableVC") as! BeaconCompanyTableVC
            
            self.navigationController?.pushViewController(beaconCompanyTableVC, animated: true)
        }
        else{
            let searchCompanyTableVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchCompanyTableVC") as! SearchCompanyTableVC
            
            self.navigationController?.pushViewController(searchCompanyTableVC, animated: true)
        }
    }
    
    private lazy var recruitment_InfoVC: Recruitment_InfoVC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "Recruitment_InfoVC") as! Recruitment_InfoVC
        
        viewController.companyDetailModel = self.companyDetailModel
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var company_InfoVC: Company_InfoVC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "Company_InfoVC") as! Company_InfoVC
        
        viewController.companyDetailModel = self.companyDetailModel
    
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
}
