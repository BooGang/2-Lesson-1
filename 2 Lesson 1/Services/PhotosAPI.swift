//
//  PhotosAPI.swift
//  2 Lesson 1
//
//  Created by Богдан Олещенко on 31.10.2021.
//

import Foundation
import Alamofire
struct Photos {
    
}

final class PhotosAPI {
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    
    func getPhotos(completion: @escaping([Photos])->()) {
        let method = "/photos.get"
        
        let parameters: Parameters = [
            "owner_id": userId,
            "album_id":"profile",
            "rev": 0,
            "extended": 1,
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
