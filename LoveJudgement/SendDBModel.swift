//
//  sendDBModel.swift
//  LoveJudgement
//
//  Created by apeirogon on 2020/10/25.
//  Copyright © 2020 ShunsukeOdani. All rights reserved.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore

class SendDBModel{
    
    var userID = String()
    var userName = String()
    var title = String()
    var myAge = String()
    var partnerAge = String()
    var myGender = String()
    var partnerGender = String()
    var relation = String()
    var talkImage = Data()
    var db = Firestore.firestore()
    
    
    //送信機能を集約する
    
    init(){
        
    
    }
    
    init(userID:String, userName:String, title:String, myAge:String, partnerAge:String, myGender:String, partnerGender:String, relation:String, talkImage:Data){
        
        self.userID = userID
        self.userName = userName
        self.title = title
        self.myAge = myAge
        self.partnerAge = partnerAge
        self.myGender = myGender
        self.partnerGender = partnerGender
        self.relation = relation
        self.talkImage = talkImage
    }
    
    func sendData(userID: String) {
        
        //送信の処理
        let imageRef = Storage.storage().reference().child("Images").child("\(UUID().uuidString + String(Date().timeIntervalSince1970)).jpg")
        
        
        imageRef.putData(talkImage, metadata: nil) { (metadata, error) in
            
            
            if error != nil{
                return
            }
            
            imageRef.downloadURL { (url, error) in
                
                if error != nil{
                    return
                }

                
                print(self.userID)
                print(self.userName)
                print(self.myAge)
                print(self.myGender)
                print(self.partnerAge)
                print(self.partnerGender)
                print(self.title)
                print(self.relation)
                print(url?.absoluteString)
                
                
                self.db.collection("users").document(userID).collection("myPosts").document().setData(
                    
                    ["userID":self.userID as Any,"userName":self.userName as Any,"title":self.title as Any,"myAge":self.myAge as Any,"partnerAge":self.partnerAge as Any,"myGender":self.myGender as Any,"partnerGender":self.partnerGender as Any,"relation":self.relation as Any,"talkImage":url?.absoluteString as Any,"postDate":Date().timeIntervalSince1970,"count":0,"better":0,"good":0,"bad":0,"worse":0]
                
                )
                
                
            }
        
        }
    }
    
    func sendProfileImageData(data:Data){
        
        let imgae = UIImage(data:data)
        //let talkImage = image.jpegdata
    }
}
