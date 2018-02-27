//
//  NoticeVC.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 23..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class NoticeVC: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate {

    @IBOutlet weak var noticeTableView: UITableView!
    
    var noticeModels: [NoticeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noticeTableView.delegate = self
        noticeTableView.dataSource = self
        
        let noticeModel: NoticeModel = NoticeModel()
        
        noticeModel.title = "제목1"
        noticeModel.occurTime = "2018.00.00 00:01"
        noticeModel.content = "내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1"
        
        let noticeModel2: NoticeModel = NoticeModel()
        
        noticeModel2.title = "제목2"
        noticeModel2.occurTime = "2018.00.00 00:02"
        noticeModel2.content = "내용2"
        
        let noticeModel3: NoticeModel = NoticeModel()
        
        noticeModel3.title = "제목1"
        noticeModel3.occurTime = "2018.00.00 00:01"
        noticeModel3.content = "내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1내용1"
 
        self.noticeModels.append(noticeModel)
        self.noticeModels.append(noticeModel2)
        self.noticeModels.append(noticeModel3)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTitleCell")! as! NoticeCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none

        cell.content.text = noticeModels[indexPath.section].content
//        cell.content.backgroundColor = UIColor.blue
        cell.content.bounces = false //스크롤 바운스 제거
        
        cell.time.text = noticeModels[indexPath.section].occurTime
//        cell.time.backgroundColor = UIColor.brown
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {//섹션뷰 갯수
        return self.noticeModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let headerHeight: CGFloat = 44
        
        return headerHeight//섹션뷰 세로길이
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //내용뷰 갯수
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {//내용뷰 길이
       let rowHeight : CGFloat = 80
       
        if(noticeModels[indexPath.section].expanded){
            return rowHeight
        }
        else{
            return 0
        }
    }
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        self.noticeModels[section].expanded = !noticeModels[section].expanded
        
        let expandedSign: Bool! = self.noticeModels[section].expanded
        
        if expandedSign == true{
            header.allowIcon.image = UIImage(named: "down_arrow_icon")
        }
        else{
            header.allowIcon.image = UIImage(named: "right_arrow_icon")
        }
        
        self.noticeTableView.beginUpdates()
        
        self.noticeTableView.reloadRows(at: [IndexPath(row: 0, section: section) ], with: .automatic)
        
        self.noticeTableView.endUpdates()
        
        //        for i in 0 ..< sections[section].contents.count{
        //            self.tableView.beginUpdates()
        //
        //            self.tableView.reloadRows(at: [IndexPath(row: i, section: section) ], with: .automatic)
        //
        //            self.tableView.endUpdates()
        //        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = ExpandableHeaderView()
    
        headerView.customInit(section: section, delegate: self)
        
        headerView.textLabel?.text = noticeModels[section].title
        headerView.textLabel?.textColor = UIColor.white
       
        //헤더에 label 추가시 필요
//        let timeOccurLabel = UILabel(frame: CGRect(x: 0, y: 12, width: tableView.frame.width - 20, height: 20))
//
//        timeOccurLabel.textAlignment = .right
//        timeOccurLabel.text = noticeModels[section].occurTime
//        timeOccurLabel.textColor = UIColor.white
//        timeOccurLabel.font = timeOccurLabel.font.withSize(11)
//        timeOccurLabel.backgroundColor = UIColor.cyan//timeOccurLabel 영역확인
        
        headerView.allowIcon = UIImageView(frame: CGRect(x: tableView.frame.width - 30, y: 12, width: 20, height: 20))
        headerView.allowIcon.image = UIImage(named: "right_arrow_icon")
        headerView.allowIcon.contentMode = .scaleAspectFit
     
        headerView.addSubview(headerView.allowIcon)
        
        return headerView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
