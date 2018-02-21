//
//  BeaconEventMainVC.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 12..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class BeaconEventVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var beaconEventTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.beaconEventTableView.delegate = self
        self.beaconEventTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeaconEventCell") as! BeaconEventCell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell.number.text = "01"
        cell.logo.backgroundColor = UIColor.black
        cell.title.text = "dd"
        cell.content.text = "content"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let InfoMainVC = self.storyboard?.instantiateViewController(withIdentifier: "InfoMainVC") as! InfoMainVC
        self.navigationController?.pushViewController(InfoMainVC, animated: true)
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
