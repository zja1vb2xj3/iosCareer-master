//
//  CompanyModel.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 21..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import Foundation
class CompanyModel{
    var boothNumber: String!//부스번호
    var imageURLStr: String!//로고
    var title: String!//회사명
    var recruitPart: String!//모집부분
    var jobDescription: String!//직무내용
    var career: String!//경력사항
    var recruitNumber:String!//모집인원
    var eligibility: String!//자격요건
    var workType: String!//근무형태
    var salary: String!//급여
    var workPlace: String!//근무지
    var screening: String!//전형방법
    var submission: String!//제출서류
    var welfare: String!//복리후생
    
    var ceoName: String!//대표자
    var participate: String! //참여지역
    
    var location: MTMapPointGeo?//위도경도
    
    var headOffice: String!//본사/연구소
    var inFactory: String!//국내공장
    var products: String!//주요생산품
    var exp: String!//회사소개
    var homePage: String!//홈페이지
    var contactNumber: String!//전화번호
    
}
