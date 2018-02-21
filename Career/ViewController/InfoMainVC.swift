//
//  CompanyInfoMainVC.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 19..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class InfoMainVC: UIViewController {

    @IBOutlet weak var recruitment_Info_Button: UIButton!
    @IBOutlet weak var company_Info_Button: UIButton!
    
    @IBOutlet weak var subView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recruitment_Info_Button.addTarget(self, action: #selector(recruitment_Info_ButtonClick), for: .touchDown)
        company_Info_Button.addTarget(self, action: #selector(company_Info_ButtonClick), for: .touchDown)
        
        recruitment_Info_Button.backgroundColor = UIColor.yellow
        company_Info_Button.backgroundColor = UIColor.black
        
        add(asChildViewController: recruitment_InfoVC)
        
        print("infoMainVC")
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
        else{
            recruitment_Info_Button.backgroundColor = UIColor.black
            company_Info_Button.backgroundColor = UIColor.yellow
            
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
    
    private lazy var recruitment_InfoVC: Recruitment_InfoVC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "Recruitment_InfoVC") as! Recruitment_InfoVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var company_InfoVC: Company_InfoVC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "Company_InfoVC") as! Company_InfoVC
        
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
}
