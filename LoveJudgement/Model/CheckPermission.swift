//
//  CheckPermission.swift
//  LoveJudgement
//
//  Created by apeirogon on 2020/10/22.
//  Copyright © 2020 ShunsukeOdani. All rights reserved.
//

import Foundation
import Photos

class CheckPermission {
    
    func showCheckPermission(){
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch(status){
                
            case .authorized:
                print("許可されてますよ")

            case .denied:
                    print("拒否")

            case .notDetermined:
                        print("notDetermined")
                
            case .restricted:
                        print("restricted")
            @unknown default: break
                
            }
            
        }
    }

}
