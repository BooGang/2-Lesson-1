//
//  DataStorage.swift
//  2 Lesson 1
//
//  Created by Air on 20.04.2021.
//

import UIKit

class DataStorage: NSObject {
    static let shared = DataStorage()
    private override init() {
        super.init()
    }
    
    var usersArray = [User]()
//    var myFriendsArray = [User]()
    
    var allGroup = [Group]()
    var myFavoriteGroup = [Group]()
}

