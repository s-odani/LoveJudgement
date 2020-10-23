//
//  ViewController.swift
//  LoveJudgement
//
//  Created by apeirogon on 2020/10/14.
//  Copyright © 2020 ShunsukeOdani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func register(_ sender: Any) {
       
    let regVC = storyboard?.instantiateViewController(withIdentifier: "register") as! RegisterViewController
        navigationController?.pushViewController(regVC, animated: true)
    }
    
    
    @IBAction func logIn(_ sender: Any) {
        let logInVC = storyboard?.instantiateViewController(withIdentifier: "logIn") as! LogInViewController
        
        navigationController?.pushViewController(logInVC, animated: true)
    }
    
}

