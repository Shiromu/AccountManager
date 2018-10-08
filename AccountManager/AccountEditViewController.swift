//
//  AccountEditViewController.swift
//  AccountManager
//
//  Created by Shiromu on 2018/10/03.
//  Copyright © 2018年 Shiromu. All rights reserved.
//

import UIKit

class AccountEditViewController: UIViewController {
    
    var accountEditChildView: AccountAddTableViewController!
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        var targetVC = childView[0]

        
//        self.addChild(accountEditChildView)
//        self.view.addSubview(accountEditChildView.view)
//        accountEditChildView.didMove(toParent: self)
        
        //参考URL : http://www.rexfeng.com/blog/2018/02/how-to-use-child-view-controllers-in-swift-4-0-programmatically/
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let tableVC = segue.destination as! AccountAddTableViewController
//        self.accountEditChildView = tableVC
//    }
    
    @IBAction func saveAccountInfo(_ sender: Any) {
        let targetVC = children[0] as! AccountAddTableViewController
        targetVC.save()
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
