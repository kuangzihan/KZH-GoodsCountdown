//
//  KZHCountdown.swift
//  Countdown
//
//  Created by 邝子涵 on 2018/6/4.
//  Copyright © 2018年 上海仁菜网络科技有限公司. All rights reserved.
//

import UIKit

class KZHCountdown: UIView {
    
    // 定时器
    fileprivate var timer: Timer?
    
    
    // MARK: - 共有
    // MARK: -- 结束时间（传递接口返回的时间戳）
    open var endTime:Double? {
        didSet {
            if timer == nil {
                let timer = Timer(timeInterval: 1, target: self, selector: #selector(refreshTime), userInfo: nil, repeats: true)
                RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
                self.timer = timer
            }
        }
    }
    
    // MARK: -- 数字Label背景颜色
    open var labelColor:UIColor? {
        didSet {
            guard let labelColor = labelColor else { return }
            hourLabel.backgroundColor = labelColor
            minuteLabel.backgroundColor = labelColor
            secondLabel.backgroundColor = labelColor
        }
    }
    
    // MARK: -- 数字Label字体颜色
    open var labelTextColor:UIColor? {
        didSet {
            guard let labelTextColor = labelTextColor else { return }
            hourLabel.textColor = labelTextColor
            minuteLabel.textColor = labelTextColor
            secondLabel.textColor = labelTextColor
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    fileprivate func setupUI() {
        addSubview(hourLabel)
        addSubview(hourColonLabel)
        addSubview(minuteLabel)
        addSubview(minuteColonLabel)
        addSubview(secondLabel)
        
        
        self.labelColor = UIColor.white
        self.labelTextColor = UIColor.black
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let textSize = self.height
        let colonSize = (self.width - (textSize * 3)) / 2
        
        hourLabel.frame = CGRect(x: 0, y: 0, width: textSize, height: textSize)
        hourColonLabel.frame = CGRect(x: hourLabel.maxX, y: 0, width: colonSize, height: textSize)
        minuteLabel.frame = CGRect(x: self.mediateX(textSize), y: 0, width: textSize, height: textSize)
        minuteColonLabel.frame = CGRect(x: minuteLabel.maxX, y: 0, width: colonSize, height: textSize)
        secondLabel.frame = CGRect(x: self.width - textSize, y: 0, width: textSize, height: textSize)
    }
    
    // MARK: - 主要实现计算时间差值方法
    @objc func refreshTime() {
        guard let endTime = endTime else { return }
        
        // 获取当前时间
        let nowDate = Date.getCurrentDate()
        // 获取结束时间
        let endDate = endTime.timestampWithDate()
        
        let calendar = NSCalendar.current
        // The result of calculating the difference from start to end.
        let components = calendar.dateComponents([.hour, .minute, .second], from: nowDate, to: endDate)
        
        guard let hour = components.hour,
            let minute = components.minute,
            let second = components.second else { return }
        
        print("差值为：\(hour)时\(minute)分\(second)秒")
        
        if hour < 0 || minute < 0 || second < 0  {
            removeTimer()
            hourLabel.text = "00"
            minuteLabel.text = "00"
            secondLabel.text = "00"
        } else {
            hourLabel.text = "\(hour.keepInt())"
            minuteLabel.text = "\(minute.keepInt())"
            secondLabel.text = "\(second.keepInt())"
        }
        

    }
    
    
    
    // MARK: - ------------------- lazy -------------------------
    // MARK: -- 时
    fileprivate lazy var hourLabel: UILabel = {
        let hourLabel = UILabel()
        hourLabel.textAlignment = .center
        hourLabel.setViewBorder(color: UIColor.clear)
        return hourLabel
    }()
    
    // MARK: -- 时 冒号
    fileprivate lazy var hourColonLabel: UILabel = {
        let hourColonLabel = UILabel()
        hourColonLabel.textAlignment = .center
        hourColonLabel.text = ":"
        return hourColonLabel
    }()
    
    // MARK: -- 分
    fileprivate lazy var minuteLabel: UILabel = {
        let minuteLabel = UILabel()
        minuteLabel.textAlignment = .center
        minuteLabel.setViewBorder(color: UIColor.clear)
        return minuteLabel
    }()
    
    // MARK: -- 分 冒号
    fileprivate lazy var minuteColonLabel: UILabel = {
        let minuteColonLabel = UILabel()
        minuteColonLabel.textAlignment = .center
        minuteColonLabel.text = ":"
        return minuteColonLabel
    }()
    
    // MARK: -- 秒
    fileprivate lazy var secondLabel: UILabel = {
        let secondLabel = UILabel()
        secondLabel.textAlignment = .center
        secondLabel.setViewBorder(color: UIColor.clear)
        return secondLabel
    }()
    
    
    // MARK: - 移除Timer
    fileprivate func removeTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
    deinit {
        removeTimer()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
