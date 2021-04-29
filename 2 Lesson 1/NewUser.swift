//
//  NewUser.swift
//  2 Lesson 1
//
//  Created by Air on 20.04.2021.
//

import Foundation
import UIKit

func setNewUser(userNumber: Int, name: String, age: UInt) -> User {
    var user = User(name: name)
    user.age = age 
    
    var imageName = String(userNumber) + "_1"
    user.avatar = UIImage(named: imageName)
    
    
    
    
    
    for index in 2...5 {
        imageName = String(userNumber) + "_" + String(index)
        if let image = UIImage(named: imageName) {
            user.fotoArray.append(image)
        }
    }
    
    return user
}
