//
//  DetailViewController.swift
//  LoveJudgement
//
//  Created by apeirogon on 2020/10/22.
//  Copyright © 2020 ShunsukeOdani. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var talkImageView: UIImageView!
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentTextView.delegate = self
        commentTextView.layer.borderColor = UIColor.darkGray.cgColor
        commentTextView.layer.borderWidth = 0.5
    commentTextView.layer.cornerRadius = 20.0
        commentTextView.text = "コメント入力(任意)"
    commentTextView.layer.masksToBounds = true
        commentTextView.textColor = UIColor.lightGray
        //タブバー非表示
        tabBarController?.tabBar.isHidden = true
        


        // Do any additional setup after loading the view.
    }
    
    //textViewのplaceholder非表示
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    //Then when the user finishes editing the text view and it's resigned as the first responder, if the text view is empty, reset its placeholder by re-adding the placeholder text and setting its color to light gray.
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "コメント入力(任意)"
            textView.textColor = UIColor.lightGray
        }
    }
    
    
    
    //キーボードをリターンで閉じるため
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
           // キーボードを閉じる
           textField.resignFirstResponder()
           return true
       }
    

    @IBAction func skip(_ sender: Any) {
        let resultVC = storyboard?.instantiateViewController(withIdentifier: "result") as! ResultViewController
        navigationController?.pushViewController(resultVC, animated: true)
    }
    
    
    @IBAction func tapImage(_ sender: Any) {
        
        selectedImage = talkImageView.image
        if selectedImage != nil {
            // ImageViewController へ遷移するために Segue を呼び出す
            performSegue(withIdentifier: "zoom",sender: nil)
        }

    }
    
    // Segue 準備
       override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
           if (segue.identifier == "zoom") {
               let imageVC: ImageViewController = (segue.destination as? ImageViewController)!
    
               // ImageViewController のselectedImgに選択された画像を設定する
               imageVC.selectedImg = selectedImage
           }
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
