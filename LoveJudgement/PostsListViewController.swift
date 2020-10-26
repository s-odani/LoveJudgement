//
//  PostsViewController.swift
//  LoveJudgement
//
//  Created by apeirogon on 2020/10/22.
//  Copyright © 2020 ShunsukeOdani. All rights reserved.
//

import UIKit

class PostsListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //タブバー非表示の画面から戻ってきたときに表示させるため
        self.tabBarController?.tabBar.isHidden = false;
    }
    

    /*@IBAction func detail(_ sender: Any) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        navigationController?.pushViewController(detailVC, animated: true)
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
