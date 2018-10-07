//
//  AccountViewController.swift
//  AccountManager
//
//  Created by Shiromu on 2018/09/27.
//  Copyright © 2018年 Shiromu. All rights reserved.
//

import UIKit
import RealmSwift

class AccountViewController: UIViewController , UITableViewDataSource{

    @IBOutlet var table:UITableView!
    var accountItem: Results<Account>!
    var tableIndex: IndexPath!
    
    let accountArray = ["twhitezs","sh1o0m","sh1"]

    override func viewDidLoad() {
        super.viewDidLoad()

        table.dataSource = self
        table.rowHeight = 70
        
        do{
            let realm = try Realm()
            accountItem = realm.objects(Account.self)
            table.reloadData()
        } catch {
            
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAccountInfo"{
            let acInfoVC = segue.destination as! AccountInfoViewController
            acInfoVC.infoIndex = tableIndex
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell") as! AccountTableViewCell
        
        let object = accountItem[indexPath.row]
        
        cell.accountImageView.image = object.accountImage
        cell.accountNameLabel.text = object.accountName
        
        return cell
    }
    
    func tableview(_ tableView: UITableView, didSelectRowAt index: IndexPath ){
        tableIndex = index
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
