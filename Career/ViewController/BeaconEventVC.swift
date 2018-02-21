//
//  BeaconEventMainVC.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 12..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class BeaconEventVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var beaconEventTableView: UITableView!
    private var companyListModels: [CompanyListModel] = []
    
    //부스번호 범위 label 변경해야함
    override func viewDidLoad() {
        super.viewDidLoad()
        self.beaconEventTableView.delegate = self
        self.beaconEventTableView.dataSource = self
        
        companyListModels = appDelegate.companyListModels
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeaconEventCell") as! BeaconEventCell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell.number.text = companyListModels[indexPath.row].boothNumber
    
        cell.logo.loadURLImage(imageUrlStr: companyListModels[indexPath.row].imageURLStr)
        cell.title.text = companyListModels[indexPath.row].title
        cell.content.text = companyListModels[indexPath.row].recruitPart
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyListModels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let InfoMainVC = self.storyboard?.instantiateViewController(withIdentifier: "InfoMainVC") as! InfoMainVC
        self.navigationController?.pushViewController(InfoMainVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight : CGFloat = 70
        
        return rowHeight
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
