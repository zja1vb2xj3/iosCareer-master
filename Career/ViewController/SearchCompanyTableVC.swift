//
//  SearchCompanyTableVC.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 23..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit
import Parse

class SearchCompanyTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

     let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var companyListModels: [CompanyListModel] = []
    
    @IBOutlet weak var companyTableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    
    var keyboardHideSign: Bool! = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.companyListModels = self.appDelegate.companyListModels
        self.companyTableView.delegate = self
        self.companyTableView.dataSource = self
        
        self.searchField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchField.resignFirstResponder()//키보드가 사라지고 나타남
        
        let returnStr: String! = self.searchField.text
        
        if returnStr != ""{//입력한 데이터가 존재함
            //검색
            
        }

        
        return true
    }
    
    @IBAction func searchFieldTouchDown(_ sender: UITextField) {
        self.searchField.resignFirstResponder()//키보드가 사라지고 나타남
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeaconEventCell") as! BeaconEventCell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell.number.text = self.companyListModels[indexPath.row].boothNumber
        
//        cell.logo.loadURLImage(imageUrlStr: self.companyListModels[indexPath.row].imageURLStr)
        cell.title.text = self.companyListModels[indexPath.row].title
        cell.content.text = self.companyListModels[indexPath.row].recruitPart
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.companyListModels.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.removeObserver(self)
        
        //타이틀로 파스에 접속해서 받아온 데이터를 infoMainVC로 전달
        let title = self.companyListModels[indexPath.row].title
        
        getCompanyDetailModel(title: title!)
    }
    
    
    func getCompanyDetailModel(title: String){
        let table = Key.CompanyContentsTableKey.self
        
        let query = PFQuery(className: table.TABLENAME)
        query.order(byAscending: table.CPY_IDX)
        
        query.whereKey(table.CPY_TITLE, equalTo: title)
        
        let companyDetailModel = CompanyDetailModel()
        
        query.findObjectsInBackground(block: {(objects: [PFObject]?, error:Error?) in
            if error == nil{
                for object in objects!{
                    companyDetailModel.title = title
                    companyDetailModel.recruitPart = object.object(forKey: table.CPY_RECRUIT_PART) as! String
                    companyDetailModel.jobDescription = object.object(forKey: table.CPY_JOB_DESCRIPTION) as! String
                    companyDetailModel.career = object.object(forKey: table.CPY_CAREER) as! String
                    companyDetailModel.recruitNumber = object.object(forKey: table.CPY_RECRUIT_NUM) as! String
                    companyDetailModel.eligibility = object.object(forKey: table.CPY_ELIGIBILITY) as! String
                    companyDetailModel.workType = object.object(forKey: table.CPY_WORK_TYPE) as! String
                    companyDetailModel.salary = object.object(forKey: table.CPY_SALARY) as! String
                    companyDetailModel.workPlace = object.object(forKey: table.CPY_WORK_PLACE) as! String
                    companyDetailModel.screening = object.object(forKey: table.CPY_SCREENING) as! String
                    companyDetailModel.submission = object.object(forKey: table.CPY_SUBMISSION) as! String
                    companyDetailModel.welfare = object.object(forKey: table.CPY_WELFARE) as! String
                    companyDetailModel.imageURLStr = object.object(forKey: table.CPY_LOGO) as! String
                    companyDetailModel.ceoName = object.object(forKey: table.CPY_CEO) as! String
                    companyDetailModel.participate = object.object(forKey: table.CPY_PARTICIPATE) as! String
                    
                    let locationStr = object.object(forKey: table.CPY_LOCATION)
                    let locationArr: [String] = self.appDelegate.separationStr(value: locationStr as! String, separatedBy: ",")
                    
                    companyDetailModel.location = MTMapPointGeo(latitude: Double(locationArr[0] )!, longitude: Double(locationArr[1])!)
                    
                    companyDetailModel.headOffice = object.object(forKey: table.CPY_HEAD_OFFICE) as! String
                    companyDetailModel.inFactory = object.object(forKey: table.CPY_FACTORY) as! String
                    companyDetailModel.products = object.object(forKey: table.CPY_PRODUCTS) as! String
                    companyDetailModel.exp = object.object(forKey: table.CPY_EXP) as! String
                    companyDetailModel.homePage = object.object(forKey: table.CPY_HOMEPAGE) as! String
                    companyDetailModel.contactNumber = object.object(forKey: table.CPY_CONTACT_NUMBER) as! String
                    
                }//end for
            }//end check nil
            //파스에 접속이 끝나는 루프
            self.moveToInfoMainVC(companyDetailModel: companyDetailModel)
        })
    }
    
    
    func moveToInfoMainVC(companyDetailModel: CompanyDetailModel){
        print("moveToInfoMainVC")
        let infoMainVC = self.storyboard?.instantiateViewController(withIdentifier: "InfoMainVC") as! InfoMainVC
        infoMainVC.companyDetailModel = nil
        infoMainVC.companyDetailModel = companyDetailModel//데이터 전달
        infoMainVC.vcIndex = Key.moveVCKey.SearchCompanyTableVCKey
        
        self.navigationController?.pushViewController(infoMainVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight : CGFloat = 70
        
        return rowHeight
    }

}
