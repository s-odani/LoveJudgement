//
//  ImageViewController.swift
//  LoveJudgement
//
//  Created by apeirogon on 2020/10/23.
//  Copyright © 2020 ShunsukeOdani. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImg: UIImage!
         
            override func viewDidLoad() {
                super.viewDidLoad()
         
                imageView.image = selectedImg
                // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
                imageView.contentMode = UIView.ContentMode.scaleAspectFit
         
            }
         
        
        // Do any additional setup after loading the view.
    }
