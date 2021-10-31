//
//  FriendsAPI.swift
//  2 Lesson 1
//
//  Created by Богдан Олещенко on 31.10.2021.
//

import Foundation
import Alamofire


struct Friend {
    
}

final class FriendsAPI {
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    
    func getFriends(completion: @escaping([Friend])->()) {
        let method = "/friends.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "order": "name",
            "fields": "photo_1, photo_2",
            "count": 10,
            "access_token": token,
            "v": version
            
        ]
        let url = baseURL + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.value)
            
        }
    }
}
