//
//  AccountViewController.swift
//  AccountManager
//
//  Created by Shiromu on 2018/09/27.
//  Copyright © 2018年 Shiromu. All rights reserved.
//

import UIKit
import RealmSwift

class AccountViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var table:UITableView!
    
    var accountItem: Results<Account>!
    var tableIndex: IndexPath!
    private var token: NotificationToken!
    
//    let accountArray = ["twhitezs","sh1o0m","sh1"]

    override func viewDidLoad() {
        super.viewDidLoad()
        //テーブル初期設定 ソースの場所 高さ  デリゲート宣言
        table.dataSource = self
        table.delegate = self
        table.rowHeight = 70
        // realmからデータを読んでくる
        do{
            let realm = try Realm()
            accountItem = realm.objects(Account.self)
            table.reloadData()
        } catch {
            print("failed")
        }
        // Do any additional setup after loading the view.
    }
    
    // realm変更監視
    override func awakeFromNib() {
        do{
            let realm = try Realm()
            accountItem = realm.objects(Account.self)
            token = accountItem.observe{ [weak self] _ in
                self?.reload()
            }
            // 参考 : https://qiita.com/ottijp/items/35dee1c03e055e450c81
        } catch {
            
        }
    }
    // 画面表示前の処理 今回この必要性を若干感じなくもないが…… わからないので一応置いておく 動けばいいかな……
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
    //segue前にする動作 値受け渡し等…
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAccountInfo"{
            let acInfoVC = segue.destination as! AccountInfoViewController
            //インデックスを渡して選択したものと同じ場所を読み込む様にしている が 仕様的にあまり良くない気がする
            acInfoVC.infoIndex = tableIndex
        }
    }
    //テーブルビューの数設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountItem.count
    }
    //テーブルビュー表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell") as! AccountTableViewCell
        
        let object = accountItem[indexPath.row]
        let image = UIImage(data: object.accountImage!)!
        
        cell.accountImageView.image = image
        cell.accountNameLabel.text = object.accountName
        
        return cell
    }
    //cellが押された時の動作
    func tableView(_ tableView: UITableView, didSelectRowAt index: IndexPath ){
        tableIndex = index
        performSegue(withIdentifier: "toAccountInfo",sender: nil)
    }
    //cellのスワイプ→削除の流れの処理
    //参考 : https://qiita.com/Simmon/items/7f93e82b0a043008e227
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //先にrealmの該当データを消してからリロードさせると上手くいく アニメーションはなくなるけど。
            deleteAccount(at: indexPath.row)
            reload()
        }
    }
    
    func deleteAccount(at index: Int){
        do{
            let realm = try! Realm()
            try! realm.write {
                realm.delete(accountItem[index])
            }
        }
    }
    
    func reload() {
        table.reloadData()
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
