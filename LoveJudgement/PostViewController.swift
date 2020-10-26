//
//  PostViewController.swift
//  LoveJudgement
//
//  Created by apeirogon on 2020/10/22.
//  Copyright © 2020 ShunsukeOdani. All rights reserved.
//

import UIKit
import Photos
import Firebase
import FirebaseAuth

class PostViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var userID = String()
    var passImage = UIImage()
    var userName = String()
    var myAge = String()
    var partnerAge = String()
    var myGender = String()
    var partnerGender = String()

    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var relationTextField: UITextField!
    
    @IBOutlet weak var agePickerView: UIPickerView!
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var talkImageView: UIImageView!
    
    let dataList = ["12歳","13歳","14歳","15歳","16歳","17歳","18歳","19歳","20歳","21歳","22歳","23歳","24歳","25歳","26歳","27歳","28歳","29歳","30歳","31歳","32歳","33歳","34歳","35歳","36歳","37歳","38歳","39歳","40歳"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //カメラの許可ポップアップ
        let checkModel = CheckPermission()
        checkModel.showCheckPermission()

        // Delegate設定
        titleTextField.delegate = self
        relationTextField.delegate = self
        agePickerView.delegate = self
        agePickerView.dataSource = self
        
        if UserDefaults.standard.object(forKey: "userName") != nil {
            userName = UserDefaults.standard.object(forKey: "userName") as! String
        }
        if UserDefaults.standard.object(forKey: "age") != nil {
            myAge = UserDefaults.standard.object(forKey: "age") as! String
        }
        if UserDefaults.standard.object(forKey: "gender") != nil {
            myGender = UserDefaults.standard.object(forKey: "gender") as! String
        }
        
    }
    
    
    //キーボードをリターンで閉じるため
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
           // キーボードを閉じる
           textField.resignFirstResponder()
           return true
       }
    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return dataList[row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ agePickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
        partnerAge = dataList[row]
        
    }
    
    
    //~~~~~~~~~~~~~~~~性別のセグメント関係~~~~~~~~~~~~~~~~~~^
    @IBAction func genderChanged(_ sender: Any) {
        
        
        
        //セグメントが変更されたときの処理
        //選択されているセグメントのインデックス
        let selectedIndex = genderSegmentedControl.selectedSegmentIndex
        print(selectedIndex)
        //選択されたインデックスの文字列を取得してラベルに設定
        partnerGender = genderSegmentedControl.titleForSegment(at: selectedIndex)!
    }
   
    
    
    //~~~~~~~~~~~~~~~~~トーク画像選択~~~~~~~~~~~~~~
    

    @IBAction func tapImageView(_ sender: Any) {
        //カメラから？アルバムから？
        
        //アラートを出す
        showAlert()
        
    }
    
    
    //カメラ立ち上げメソッド
    
    //アルバム
    func doAlbum(){
        
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        
        //カメラ利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if info[.originalImage] as? UIImage != nil{
            
            let selectedImage = info[.originalImage] as! UIImage
            talkImageView.image = selectedImage
            picker.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    //アラート
    func showAlert(){
        
        let alertController = UIAlertController(title: "トーク画像選択", message: "選んでね！", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "アルバム", style: .default) { (alert) in
            
            self.doAlbum()
            
        }

        let action2 = UIAlertAction(title: "キャンセル", style: .cancel)
        
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func send(_ sender: Any) {
        //送信
        if titleTextField.text?.isEmpty == true ||
        relationTextField.text?.isEmpty == true{
            return
        }
        
        let passData = talkImageView.image!.jpegData(compressionQuality: 0.01)
        let sendDBModel = SendDBModel(userID: Auth.auth().currentUser!.uid, userName: userName, title: titleTextField.text!, myAge: myAge, partnerAge: partnerAge, myGender: myGender, partnerGender: partnerGender, relation: relationTextField.text!, talkImage: passData!)
            
            //userID: Auth.auth().currentUser!.uid, userName: userName, title: titleTextField.text!, relation: relationTextField.text!, talkImage: passData!)
        sendDBModel.sendData(userID: Auth.auth().currentUser!.uid)
        
        //次の遷移画面へのコード
        
    }
    

}
