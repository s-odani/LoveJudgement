//
//  LogInViewController.swift
//  LoveJudgement
//
//  Created by apeirogon on 2020/10/21.
//  Copyright © 2020 ShunsukeOdani. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    //キーボードをリターンで閉じるため
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
           // キーボードを閉じる
           textField.resignFirstResponder()
           return true
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
