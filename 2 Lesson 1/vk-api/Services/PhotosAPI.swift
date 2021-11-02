//
//  PhotosAPI.swift
//  2 Lesson 1
//
//  Created by Богдан Олещенко on 31.10.2021.
//

import Foundation
import Alamofire
import SwiftyJSON


final class PhotosAPI {
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    
    func getPhotos(completion: @escaping([Photo])->()) {
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
            guard let data = response.data else {return}
            
            debugPrint(response.data?.prettyJSON as Any)
            
            do {
                let photosJSON = try JSONDecoder().decode(PhotosJSON.self, from: data)

            
                let photos: [Photo] = photosJSON.response.items
                
                completion(photos)
            } catch {
                print(error)
            }
        }
    }
}
