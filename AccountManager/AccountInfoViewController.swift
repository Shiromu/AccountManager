//
//  AccountInfoViewController.swift
//  AccountManager
//
//  Created by Shiromu on 2018/10/03.
//  Copyright © 2018年 Shiromu. All rights reserved.
//

import UIKit
import RealmSwift

class AccountInfoViewController: UIViewController {

    var accountItem: Results<Account>!
    @IBOutlet weak var accountImageView: UIImageView!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    var infoIndex: IndexPath!
    
    var service = ""
    var name = ""
    var image: UIImage!
//    let accountInfoTVC: AccountInfoTableViewController = AccountInfoTableViewController()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        addChild(accountInfoTVC)

        
        do{
            let realm = try Realm()
            accountItem = realm.objects(Account.self)
        } catch {
            
        }
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setInfo()
    }
    
    //画面の表示を設定。
    func setInfo(){
        let object = accountItem[infoIndex.row]
        name = object.accountName
        service = object.accountService
        image = object.accountImage
        serviceLabel.text = service
        userNameLabel.text = name
        accountImageView.image = image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "accountInfoSegue"{
            let acInfoTableVC = segue.destination as! AccountInfoTableViewController
            acInfoTableVC.infoIndex = infoIndex
        }
    }
    
//    func childview(){
//        let childViewController = self.children
//
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
