//
//  LZHCountdownListManager.swift
//  Countdown
//
//  Created by 邝子涵 on 2018/6/5.
//  Copyright © 2018年 上海仁菜网络科技有限公司. All rights reserved.
//

import UIKit

class KZHCountdownListManager: NSObject {
    // MARK: - 私有
    // 接收传入的tableView
    fileprivate var tableView: UITableView?
    // 接收传入的结束时间数组
    fileprivate var dateArray: [Double]?
    // 定时器
    fileprivate var codeTimer:DispatchSourceTimer?
    
    
    override init() {
        super.init()
        
    }
    
    convenience init(tableView: UITableView, dateArray: [Double]) {
        self.init()
        
        self.tableView = tableView
        self.dateArray = dateArray
        
        setCountDown()
    }
    
    // MARK: - 定时器
    func setCountDown() {
        if codeTimer != nil { return }
        
        let queue = DispatchQueue.global()
        codeTimer = DispatchSource.makeTimerSource(queue: queue)
        codeTimer?.schedule(wallDeadline: .now(), repeating: .seconds(1))
        codeTimer?.setEventHandler { [weak self] in
            DispatchQueue.main.async(execute: {
                guard let cells = self?.tableView?.visibleCells else { return }
                guard let dateArray = self?.dateArray else { return }
                for cell in cells {
                    guard let cell = cell as? TableViewCell else { return }
                    cell.dateView.endTime = dateArray[cell.tag]
                }
            })
        }
        codeTimer?.resume()
    }
    
    func destoryTimer() {
        if codeTimer != nil {
            codeTimer?.cancel()
            codeTimer = nil
        }
    }
    
}
