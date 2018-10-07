//
//  Account.swift
//  AccountManager
//
//  Created by Shiromu on 2018/10/05.
//  Copyright © 2018年 Shiromu. All rights reserved.
//

import Foundation
import RealmSwift

class Account: Object{
    @objc dynamic var accountImage: UIImage? = nil
    @objc dynamic var accountName = ""
    @objc dynamic var accountID = ""
    @objc dynamic var accountPass = ""
    @objc dynamic var accountLink = ""
    @objc dynamic var accountService = ""
}
