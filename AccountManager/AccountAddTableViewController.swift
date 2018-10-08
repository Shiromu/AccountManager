//
//  AccountAddTableViewController.swift
//  AccountManager
//
//  Created by Shiromu on 2018/10/05.
//  Copyright © 2018年 Shiromu. All rights reserved.
//

import UIKit
import RealmSwift

class AccountAddTableViewController: UITableViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var accountImage: UIImageView!
    @IBOutlet weak var accountNameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var linkTextField: UITextField!
    var selectImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //デリゲートの場所宣言
        accountNameTextField.delegate = self as? UITextFieldDelegate
        idTextField.delegate = self as? UITextFieldDelegate
        mailTextField.delegate = self as? UITextFieldDelegate
        passTextField.delegate = self as? UITextFieldDelegate
        linkTextField.delegate = self as? UITextFieldDelegate
        selectImage = UIImage(named: "defaultIcon.png")
        accountImage.image = selectImage
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    @IBAction func selectIconImage(){
        // UIImageView…に重なったボタンがタップされた時の動作を入力
        let pickerController : UIImagePickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = self
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // keyboardを隠す
        textField.resignFirstResponder()
        
        return true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    //ヒモ付が出来ない
    //uiimagepickercontrolleroriginalimageがでてこない
    //出るわけがない Swift4.2から仕様が変わったとか 結構そういう事案が出ているのでエラーを出してGoogle先生に訊こう。
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        let image = info[UIImagePickerControllerEditedImage] as! UIImage
//        accountImage.image = image
//        self.dismiss(animated: true, completion: nil)
//    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        selectImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        accountImage.image = selectImage
        self.dismiss(animated: true, completion: nil)
    }
    
    public func save(){
        do{
            let realm = try Realm()
            let newAccount = Account()
            //代入をしていく
            newAccount.accountName = accountNameTextField.text!
            newAccount.accountID = idTextField.text!
            newAccount.accountPass = passTextField.text!
            newAccount.accountLink = linkTextField.text!
            newAccount.accountImage = selectImage
            
            try! realm.write {
                realm.add(newAccount)
                print("AddSuccess!")
            }
        }catch {
            print("AddFailed……")
        }
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
