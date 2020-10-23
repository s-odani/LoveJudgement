//
//  RegisterViewController.swift
//  LoveJudgement
//
//  Created by apeirogon on 2020/10/21.
//  Copyright © 2020 ShunsukeOdani. All rights reserved.
//

import UIKit



class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,  UITextFieldDelegate {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var agePickerView: UIPickerView!
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
    let dataList = ["11歳","12歳","13歳","14歳","15歳","16歳","17歳","18歳","19歳","20歳","21歳","22歳","23歳","24歳","25歳","26歳","27歳","28歳","29歳","30歳","31歳","32歳","33歳","34歳","35歳","36歳","37歳","38歳","39歳","40歳"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate設定
        nameTextField.delegate = self
        idTextField.delegate = self
        passwordTextField.delegate = self
        agePickerView.delegate = self
        agePickerView.dataSource = self
        
    }
    
    //キーボードをリターンで閉じるため
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
           // キーボードを閉じる
           textField.resignFirstResponder()
           return true
       }
    
    
    //~~~~~~~~~~~~~~~~~~~~~~年齢のpicker関係~~~~~~~~~~~~~~~~~~~~~~
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
        
        // = dataList[row]
        
    }
    
    
    //~~~~~~~~~~~~~~~~性別のセグメント関係~~~~~~~~~~~~~~~~~~^
    @IBAction func genderChanged(_ sender: Any) {
        //セグメントが変更されたときの処理
               //選択されているセグメントのインデックス
               //let selectedIndex = segmentedControl.selectedSegmentIndex
               //選択されたインデックスの文字列を取得してラベルに設定
               //label.text = segmentedControl.titleForSegmentAtIndex(selectedIndex)
    }
    
    
    
 /*   @IBAction func posts(_ sender: Any) {
        let postsVC = storyboard?.instantiateViewController(withIdentifier: "posts") as! PostsViewController
        navigationController?.pushViewController(postsVC, animated: true)
    }*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
