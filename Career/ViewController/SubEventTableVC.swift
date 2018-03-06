//
//  SubEventTableVC.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 28..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import UIKit

class SubEventTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var subEventModels: [SubEventModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        let subEventModel1: SubEventModel = SubEventModel()
        
        subEventModel1.image = UIImage(named: "subEvent1.PNG")
        subEventModel1.title = "취업컨설팅"
        subEventModel1.content = "서류 전형 및 면접 전형 시 채용 담당자\n에게 좀 더 어필할 수 있는 노하우를\n알려드립니다."
        
        let subEventModel2: SubEventModel = SubEventModel()
        
        subEventModel2.image = UIImage(named: "subEvent2.PNG")
        subEventModel2.title = "컬러이미지 컨설팅"
        subEventModel2.content = "나에게 어울리는 색을 찾아 면접 시\n더 좋은 이미지를 어필 할 수 있도록\n도와줍니다."
        
        
        let subEventModel3: SubEventModel = SubEventModel()
        
        subEventModel3.image = UIImage(named: "subEvent3.PNG")
        subEventModel3.title = "메이크업/헤어 컨설팅"
        subEventModel3.content = "면접 상황에 맞는 맞춤형 메이크업과\n면접관들에게 좋은 인상을 심어 줄수 있는\n헤어스타일링을 컨설팅해드립니다."
        
        
        let subEventModel4: SubEventModel = SubEventModel()
        
        subEventModel4.image = UIImage(named: "subEvent4.PNG")
        subEventModel4.title = "사진 촬영/인화(무료)"
        subEventModel4.content = "입사지원 시 꼭 필요한 사진을 전문\n사진작가가 촬영하고 현장에서 인화하여\n무료로 제공합니다."
        
        let subEventModel5: SubEventModel = SubEventModel()
        
        subEventModel5.image = UIImage(named: "subEvent5.PNG")
        subEventModel5.title = "캐리커쳐"
        subEventModel5.content = "개성있는 이력서를 위해 나만의\n캐리커쳐를 만들어 볼 수 있습니다."
        
        let subEventModel6: SubEventModel = SubEventModel()
        
        subEventModel6.image = UIImage(named: "subEvent6.PNG")
        subEventModel6.title = "스트레스 검사"
        subEventModel6.content = "스트레스 검사를 통해 스트레스 지수와\n건강상태에 대해 알아볼 수 있습니다."
        
        self.subEventModels.append(subEventModel1)
        self.subEventModels.append(subEventModel2)
        self.subEventModels.append(subEventModel3)
        self.subEventModels.append(subEventModel4)
        self.subEventModels.append(subEventModel5)
        self.subEventModels.append(subEventModel6)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = 100
        
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubEventTableCell") as! SubEventTableCell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell.loadImageView.image = subEventModels[indexPath.row].image
        cell.title.text = subEventModels[indexPath.row].title
        cell.content.text = subEventModels[indexPath.row].content
        
        return cell
    }
    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subEventModels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subEventDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "SubEventDetailVC") as! SubEventDetailVC
        
        subEventDetailVC.uiImage = self.subEventModels[indexPath.row].image
        subEventDetailVC.titleStr = self.subEventModels[indexPath.row].title
        subEventDetailVC.contentStr = self.subEventModels[indexPath.row].content
        
        self.navigationController?.pushViewController(subEventDetailVC, animated: true)
    }
    

}
