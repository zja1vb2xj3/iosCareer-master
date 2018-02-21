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
    
    @IBOutlet weak var titleLabel1: UILabel!
    @IBOutlet weak var contentLabel1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
//        initSubView()
    }
    
    func initSubView(){
        var viewYPosition : CGFloat = 0
        
        titleLabel1.text = "모집부분"
        contentLabel1.text = "1"
        
        viewYPosition += titleLabel1.frame.height
        
        let titleLabel2 = UILabel.init(frame: CGRect(x: 0, y: viewYPosition, width: titleLabel1.frame.width, height: titleLabel1.frame.height))
        
        let contentLabel2 = UILabel.init(frame: CGRect(x: contentLabel1.frame.origin.x, y: viewYPosition, width: contentLabel1.frame.width, height: contentLabel1.frame.height))
        
        titleLabel2.text = "직무내용"
        contentLabel2.text = "2"
        
        viewYPosition += titleLabel1.frame.height
        
        let titleLabel3 = UILabel.init(frame: CGRect(x: 0, y: viewYPosition, width: titleLabel1.frame.width, height: titleLabel1.frame.height))
        
        let contentLabel3 = UILabel.init(frame: CGRect(x: contentLabel1.frame.origin.x, y: viewYPosition, width: contentLabel1.frame.width, height: contentLabel1.frame.height))
        
        titleLabel3.text = "경력사항"
        contentLabel3.text = "3"
        
        viewYPosition += titleLabel1.frame.height
        
        let titleLabel4 = UILabel.init(frame: CGRect(x: 0, y: viewYPosition, width: titleLabel1.frame.width, height: titleLabel1.frame.height))
        
        let contentLabel4 = UILabel.init(frame: CGRect(x: contentLabel1.frame.origin.x, y: viewYPosition, width: contentLabel1.frame.width, height: contentLabel1.frame.height))
        
        
        titleLabel4.text = "모집인원"
        contentLabel4.text = "4"
        
        viewYPosition += titleLabel1.frame.height
        
        let titleLabel5 = UILabel.init(frame: CGRect(x: 0, y: viewYPosition, width: titleLabel1.frame.width, height: titleLabel1.frame.height*2))
        
        let contentLabel5 = UILabel.init(frame: CGRect(x: contentLabel1.frame.origin.x, y: viewYPosition, width: contentLabel1.frame.width, height: contentLabel1.frame.height*2))

        
        contentLabel5.numberOfLines = 0
        titleLabel5.text = "자격요건"
        contentLabel5.text = "관련전공자우대, 동종경력자우대,\n인근거주자우대"
        
        viewYPosition += titleLabel5.frame.height
        
        let titleLabel6 = UILabel.init(frame: CGRect(x: 0, y: viewYPosition, width: titleLabel1.frame.width, height: titleLabel1.frame.height))
        
        let contentLabel6 = UILabel.init(frame: CGRect(x: contentLabel1.frame.origin.x, y: viewYPosition, width: contentLabel1.frame.width, height: contentLabel1.frame.height))
  
        
        titleLabel6.text = "근무형태"
        contentLabel6.text = "6"
        
        viewYPosition += titleLabel1.frame.height
        
        let titleLabel7 = UILabel.init(frame: CGRect(x: 0, y: viewYPosition, width: titleLabel1.frame.width, height: titleLabel1.frame.height*2))
        
        let contentLabel7 = UILabel.init(frame: CGRect(x: contentLabel1.frame.origin.x, y: viewYPosition, width: contentLabel1.frame.width, height: contentLabel1.frame.height*2))
    
        contentLabel7.numberOfLines = 0
        titleLabel7.text = "급여"
        contentLabel7.text = "신입 : 연  2,700만원(대졸초임)\n경력 : 면접 후 결정"
        
        viewYPosition += titleLabel7.frame.height
        
        let titleLabel8 = UILabel.init(frame: CGRect(x: 0, y: viewYPosition, width: titleLabel1.frame.width, height: titleLabel1.frame.height))
        
        let contentLabel8 = UILabel.init(frame: CGRect(x: contentLabel1.frame.origin.x, y: viewYPosition, width: contentLabel1.frame.width, height: contentLabel1.frame.height))
        
        titleLabel8.text = "근무지"
        contentLabel8.text = "8"
        
        viewYPosition += titleLabel1.frame.height
        
        let titleLabel9 = UILabel.init(frame: CGRect(x: 0, y: viewYPosition, width: titleLabel1.frame.width, height: titleLabel1.frame.height))
        
        let contentLabel9 = UILabel.init(frame: CGRect(x: contentLabel1.frame.origin.x, y: viewYPosition, width: contentLabel1.frame.width, height: contentLabel1.frame.height))
        
        titleLabel9.text = "전형방법"
        contentLabel9.text = "9"
        
        viewYPosition += titleLabel1.frame.height
        
        let titleLabel10 = UILabel.init(frame: CGRect(x: 0, y: viewYPosition, width: titleLabel1.frame.width, height: titleLabel1.frame.height*2))
        
        let contentLabel10 = UILabel.init(frame: CGRect(x: contentLabel1.frame.origin.x, y: viewYPosition, width: contentLabel1.frame.width, height: contentLabel1.frame.height*2))
        
        contentLabel10.numberOfLines = 0
        titleLabel10.text = "제출서류"
        contentLabel10.text = "이력서, 졸업증명서, 주민등록등본,\n경력증명서"
        
        createLabelBorder(label: titleLabel1)
        createLabelBorder(label: contentLabel1)
        createLabelBorder(label: titleLabel2)
        createLabelBorder(label: contentLabel2)
        createLabelBorder(label: titleLabel3)
        createLabelBorder(label: contentLabel3)
        createLabelBorder(label: titleLabel4)
        createLabelBorder(label: contentLabel4)
        createLabelBorder(label: titleLabel5)
        createLabelBorder(label: contentLabel5)
        createLabelBorder(label: titleLabel6)
        createLabelBorder(label: contentLabel6)
        createLabelBorder(label: titleLabel7)
        createLabelBorder(label: contentLabel7)
        createLabelBorder(label: titleLabel8)
        createLabelBorder(label: contentLabel8)
        createLabelBorder(label: titleLabel9)
        createLabelBorder(label: contentLabel9)
        createLabelBorder(label: titleLabel10)
        createLabelBorder(label: contentLabel10)
        
        scrollView.addSubview(titleLabel2)
        scrollView.addSubview(contentLabel2)
        scrollView.addSubview(titleLabel3)
        scrollView.addSubview(contentLabel3)
        scrollView.addSubview(titleLabel4)
        scrollView.addSubview(contentLabel4)
        scrollView.addSubview(titleLabel5)
        scrollView.addSubview(contentLabel5)
        scrollView.addSubview(titleLabel6)
        scrollView.addSubview(contentLabel6)
        scrollView.addSubview(titleLabel7)
        scrollView.addSubview(contentLabel7)
        scrollView.addSubview(titleLabel8)
        scrollView.addSubview(contentLabel8)
        scrollView.addSubview(titleLabel9)
        scrollView.addSubview(contentLabel9)
        scrollView.addSubview(titleLabel10)
        scrollView.addSubview(contentLabel10)
        
        
    }
    
    func createLabelBorder(label : UILabel) {
        label.layer.borderWidth = 0.5
        label.layer.borderColor = UIColor.black.cgColor
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
