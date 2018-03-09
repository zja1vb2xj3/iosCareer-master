//
//  TimeManager.swift
//  Career
//
//  Created by Beaconyx Corp. on 2018. 3. 7..
//  Copyright © 2018년 Beaconyx. All rights reserved.
//

class TimeManager{
    private let date: NSDate!
    private let formatter: DateFormatter!
    
    init() {
        self.date = NSDate()
        self.formatter = DateFormatter()
          self.formatter.timeZone = TimeZone.current
    }

    func getCurrentTime() -> String{
        self.formatter.dateFormat = "yyMMdd HH:mm"
        
        let dateString = self.formatter.string(from: self.date as Date)
        
        return dateString
    }
    
    func getMonthOfDay() -> String {
        self.formatter.dateFormat = "MMdd"
        let dateString = self.formatter.string(from: self.date as Date)
        
        return dateString
    }

}
