//
//  NoticeVC.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 23..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class NoticeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var noticeTableView: UITableView!
    
    var noticeModels: [NoticeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noticeTableView.delegate = self
        noticeTableView.dataSource = self
        
        let noticeModel: NoticeModel = NoticeModel()
        
        noticeModel.title = "제목"
        noticeModel.occurTime = "2018.00.00 00:00"
        noticeModel.content = "내용"
        
        let noticeModel2: NoticeModel = NoticeModel()
        
        noticeModel2.title = "제목"
        noticeModel2.occurTime = "2018.00.00 00:00"
        
        self.noticeModels.append(noticeModel)
        self.noticeModels.append(noticeModel2)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTitleCell") as! NoticeTitleCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none

        cell.title.text = self.noticeModels[indexPath.row].title
        cell.occurTime.text = self.noticeModels[indexPath.row].occurTime

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.noticeModels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //클릭을 하면 cell 하단에 뷰를 애니메이션 및 내용을 보여줌
        print("클릭")
        let cell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        let contentLabel = UILabel(frame: cell.frame)
        
        contentLabel.backgroundColor = UIColor.black
        
        cell.contentView.addSubview(contentLabel)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight : CGFloat = 50

        return rowHeight
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
