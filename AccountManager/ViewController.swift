//
//  ViewController.swift
//  AccountManager
//
//  Created by Shiromu on 2018/09/27.
//  Copyright © 2018年 Shiromu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, /*UITableViewDelegate,*/ UITableViewDataSource {

    @IBOutlet var table:UITableView!
    
    let serviceArray = ["Twitter","Google","Mastodon"]
    let accountCount = [3,2,1]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.rowHeight = 70
//        table.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceArray.count
    }
    //セルに値をセットするデータメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セル取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "serviceCell") as! ServiceTableViewCell
        
        cell.serviceImageView.image = UIImage(named: "wakarimi.png")
        cell.serviceNameLabel.text = serviceArray[indexPath.row]
        cell.accountCountLabel.text = String(accountCount[indexPath.row])
       
        
        return cell
    }

}

