//
//  Date+conversion.swift
//  FreshQiaoYY
//
//  Created by 邝子涵 on 2018/5/3.
//  Copyright © 2018年 上海仁菜网络科技有限公司. All rights reserved.
//

import Foundation


extension Double {
    
    // MARK: - 时间戳转换成Date
    func timestampWithDate() -> Date {
        let date = Date.init(timeIntervalSince1970: self)
        let zone = NSTimeZone.system
        let interval = zone.secondsFromGMT(for: date)
        let localeDate = date.addingTimeInterval(TimeInterval(interval))
        return localeDate
    }
    
    
}

extension String {
    /// 获取不为options字符串
    ///
    /// - Returns: 不为options字符串
    static func getString(_ string:String?) -> String {
        if String.isStringNil(string) {
            return ""
        } else {
            return string!
        }
    }
    
    /// 判断字符串是否为空
    ///
    /// - Parameter string: 传入字符串
    /// - Returns: true为nil false不为nil
    static func isStringNil(_ string:String?) -> Bool {
        guard let string = string else { return true }
        if string.count == 0 {
            return true
        } else {
            return false
        }
    }
}


extension Int {
    // MARK: - Int保留多少位 默认为2
    func keepInt(_ digits:Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = digits
        return String.getString(formatter.string(for: self))
    }
}

extension Date {
    
    // MARK: - 获取当前时区Date
    static func getCurrentDate() -> Date {
        let nowDate = Date()
        let zone = NSTimeZone.system
        let interval = zone.secondsFromGMT(for: nowDate)
        let localeDate = nowDate.addingTimeInterval(TimeInterval(interval))
        return localeDate
    }
    
    
    static func stringFromDate(dateString:String, formatter:String = "HH:mm:ss") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        return dateFormatter.date(from: dateString)
    }
    
    
    static func dateFromString(date:Date, formatter:String = "HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        return dateFormatter.string(from: date)
    }
    
    
    
    
    
}
