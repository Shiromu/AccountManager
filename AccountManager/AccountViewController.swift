//
//  AccountViewController.swift
//  AccountManager
//
//  Created by Shiromu on 2018/09/27.
//  Copyright © 2018年 Shiromu. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController , UITableViewDataSource{

    @IBOutlet var table:UITableView!
    
    let accountArray = ["twhitezs","sh1o0m","sh1"]

    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self
        table.rowHeight = 70
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell") as! AccountTableViewCell
        
        cell.accountImageView.image = UIImage(named: "wakarimi.png")
        cell.accountNameLabel.text = accountArray[indexPath.row]
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
