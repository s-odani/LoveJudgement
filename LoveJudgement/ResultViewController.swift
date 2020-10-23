//
//  ResultViewController.swift
//  LoveJudgement
//
//  Created by apeirogon on 2020/10/22.
//  Copyright © 2020 ShunsukeOdani. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    

    @IBAction func backToPosts(_ sender: Any) {
        // ２階層前の画面に戻るサンプル
        //layere_number：階層番号を表す。０がトップ画面（rootView）
           let layere_number = navigationController!.viewControllers.count
        
           self.navigationController?.popToViewController(navigationController!.viewControllers[layere_number-3], animated: true)
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
