//
//  CompanyInfoMainVC.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 19..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class InfoMainVC: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var companyTitle: UILabel!
    @IBOutlet weak var recruitment_Info_Button: UIButton!
    @IBOutlet weak var company_Info_Button: UIButton!
    
    @IBOutlet weak var subView: UIView!
    
    var companyDetailModel: CompanyDetailModel!
    
    var vcIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        NotificationCenter.default.removeObserver(self)
        self.companyTitle.text = self.companyDetailModel.title
    
        recruitment_Info_Button.addTarget(self, action: #selector(recruitment_Info_ButtonClick), for: .touchDown)
        company_Info_Button.addTarget(self, action: #selector(company_Info_ButtonClick), for: .touchDown)
        
        recruitment_Info_Button.backgroundColor = UIColor.yellow
        company_Info_Button.backgroundColor = UIColor.black
        
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
        if buttonindex == 0 {
            recruitment_Info_Button.backgroundColor = UIColor.yellow
            company_Info_Button.backgroundColor = UIColor.black
            
            removeChildView(asChildViewController: company_InfoVC)
            add(asChildViewController: recruitment_InfoVC)
        }
        else if buttonindex == 1{
            recruitment_Info_Button.backgroundColor = UIColor.black
            company_Info_Button.backgroundColor = UIColor.yellow
            
            removeChildView(asChildViewController: recruitment_InfoVC)
            add(asChildViewController: company_InfoVC)
        }
        else{
            removeChildView(asChildViewController: company_InfoVC)
            removeChildView(asChildViewController: recruitment_InfoVC)
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
