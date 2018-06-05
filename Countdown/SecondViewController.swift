//
//  SecondViewController.swift
//  Countdown
//
//  Created by 邝子涵 on 2018/6/5.
//  Copyright © 2018年 上海仁菜网络科技有限公司. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var countdown: KZHCountdownListManager?
    
    let dateArray:[Double] = [1528257600,
                              1528344000,
                              1528430400,
                              1528516800,
                              1528603200,
                              1528603221,
                              1528257600,
                              1528344000,
                              1528430400,
                              1528516800,
                              1528603200,
                              1528603221,
                              1528257600,
                              1528344000,
                              1528430400,
                              1528516800,
                              1528603200,
                              1528603221,
                              1528257600,
                              1528344000,
                              1528430400,
                              1528516800,
                              1528603200,
                              1528603221,
                              1528257600,
                              1528344000,
                              1528430400,
                              1528516800,
                              1528603200,
                              1528603221,
                              1528257600,
                              1528344000,
                              1528430400,
                              1528516800,
                              1528603200,
                              1528603221]
    
    // MARK: - tableView
    lazy var baseTableView: UITableView = {
        let baseTableView = UITableView(frame: self.view.bounds)
        baseTableView.delegate = self
        baseTableView.dataSource = self
        
        baseTableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.tableViewCellReuse)
        
        return baseTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(baseTableView)
        
        countdown = KZHCountdownListManager(tableView: baseTableView, dateArray: dateArray)
    }
    
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.tableViewCellReuse) as! TableViewCell
        cell.tag = indexPath.row
        // 重用池方法赋值，防止滑动时数据错乱
        cell.dateView.endTime = dateArray[indexPath.row]
        return cell
    }
    
    
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    deinit {
        countdown?.destoryTimer()
    }

}


class TableViewCell: UITableViewCell {
    
    
    lazy var dateView: KZHCountdownView = {
        let dateView = KZHCountdownView(frame: .zero, isStartTimer: false)
        return dateView
    }()
    
    
    static let tableViewCellReuse = "tableViewCellReuse"
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    func setupUI() {
        contentView.addSubview(dateView)
        contentView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dateView.frame = CGRect(x: mediateX(150), y: mediateY(30), width: 150, height: 30)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit")
    }
}


