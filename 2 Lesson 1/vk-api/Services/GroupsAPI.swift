//
//  GroupsAPI.swift
//  2 Lesson 1
//
//  Created by Богдан Олещенко on 31.10.2021.
//

import Foundation
import Alamofire
import SwiftyJSON
//SwiftyJSON

struct Groups {
    var id: Int = 0
    var name: String = ""
    var photo100: String = ""
    
    init(json: JSON){
        self.id = json["id"].intValue
        self.name = json["name"].string ?? ""
        self.photo100 = json["photo_100"].string ?? ""
        
    }
}

final class GroupsAPI {
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.81"
    
    func getGroups(completion: @escaping([Groups])->()) {
        let method = "/groups.get"
        
        let parameters: Parameters = [
            "user_id": userId,
            "extended": 1,
            "fields": "city, status",
            "filter":"groups, publics",
            "count": 10,
            "access_token": token,
            "v": version
            
        ]
        let url = baseURL + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            guard let data = response.data else {return}
            
            
            debugPrint(response.data?.prettyJSON)
            
            do {
                guard let items = JSON(data)["response"]["items"].array else {return}
                
                let groups = items.map{Groups(json: $0)}
                
                completion(groups)
            } catch {
                print(error)
            }
        }
    }
}

