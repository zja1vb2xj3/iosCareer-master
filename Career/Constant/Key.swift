//
//  Key.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 2. 21..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

import Foundation
 class Key{
    struct  NotificationNameKey{
        static let loadSuccessNotification_Key: String = "Load"
        static let beaconOccurNotification_Key: String = "Beacon"
        static let getCompanyDetailNotification_Key: String = "DetailCompany"
    }
    
    struct BeaconContentsTableKey {
        static let TABLENAME: String = "TB_Beacon_Contents_Ko"
        static let BCS_IDX: String = "BCS_IDX"
        static let BCS_BOOTH_RANGE: String = "BCS_BOOTH_RANGE"
        static let BCS_BEACON_ID: String = "BCS_BEACON_ID"
        static let BCS_BEACON_MAJOR: String = "BCS_BEACON_MAJOR"
        static let BCS_BEACON_MINOR: String = "BCS_BEACON_MINOR"
        static let BCS_RSSI_COMPLEMENT: String = "BCS_RSSI_COMPLEMENT"
    }
    //비콘 데이터를 로딩때 받아올때 키는 비콘아이디 값은 부스범위
    //비콘이 반응됫을때 비콘 아이디로 부스범위를 찾는다
    //찾아진 부스 범위로 회사 데이터에 동일한 부스 범위를 검색해서 컨텐츠를 받아옴
    
    
    struct CompanyContentsTableKey {
        static let TABLENAME: String = "TB_Company_Ko"
        static let CPY_IDX: String = "CPY_IDX"
        static let CPY_LOGO: String =  "CPY_LOGO"
        static let CPY_TITLE: String = "CPY_TITLE"
        
        static let CPY_RECRUIT_PART: String = "CPY_RECRUIT_PART"//모집부분
        static let CPY_JOB_DESCRIPTION: String = "CPY_JOB_DESCRIPTION"//근무내용
        static let CPY_CAREER: String = "CPY_CAREER"//경력사항
        static let CPY_RECRUIT_NUM: String = "CPY_RECRUIT_NUM"//모집인원
        static let CPY_ELIGIBILITY: String = "CPY_ELIGIBILITY"//자격요건
        static let CPY_WORK_TYPE: String = "CPY_WORK_TYPE"//근무형태
        static let CPY_SALARY: String = "CPY_SALARY"//급여
        static let CPY_WORK_PLACE: String = "CPY_WORK_PLACE"//근무지
        static let CPY_SCREENING: String = "CPY_SCREENING"//전형방법
        static let CPY_SUBMISSION: String = "CPY_SUBMISSION"//제출서류
        static let CPY_WELFARE: String = "CPY_WELFARE"//복리후생
        static let CPY_CEO: String = "CPY_CEO"//대표자
        static let CPY_PARTICIPATE: String = "CPY_PARTICIPATE"//참여지역
        static let CPY_LOCATION: String = "CPY_LOCATION"//위치
        
        static let CPY_HEAD_OFFICE: String = "CPY_HEAD_OFFICE"//본사/연구소
        static let CPY_FACTORY: String = "CPY_FACTORY"//국내공장
        static let CPY_PRODUCTS: String = "CPY_PRODUCTS"//주요생산품
        static let CPY_EXP: String = "CPY_EXP"//회사소개
        static let CPY_HOMEPAGE: String = "CPY_HOMEPAGE"//홈페이지
        static let CPY_CONTACT_NUMBER: String = "CPY_CONTACT_NUMBER"//전화번호
    }
    
    struct moveVCKey {
        static let BeaconCompanyTableVCKey: Int = 0
        static let SearchCompanyTableVCKey: Int = 1
    }
    
    struct AccountTableKey{
        static let TABLENAME: String = "TB_Account_Ko"
        static let ACT_USER_ID: String = "ACT_USER_ID"
        static let ACT_USER_OS: String = "ACT_USER_OS"
        static let ACT_USER_PHONE_MODEL: String = "ACT_USER_PHONE_MODEL"
        static let ACT_USER_OS_VERSION: String = "ACT_USER_OS_VERSION"
    }
    
    struct StatisticsTableKey {
        static let TABLENAME: String = "TB_Statistics"
        static let TIME: String = "TIME"
        static let BEACON_ID: String = "BEACON_ID"
        static let CLICK_ENTER: String = "CLICK_ENTER"
    }
    
    
}
