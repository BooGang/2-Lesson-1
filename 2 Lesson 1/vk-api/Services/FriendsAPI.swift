//
//  FriendsAPI.swift
//  2 Lesson 1
//
//  Created by Богдан Олещенко on 31.10.2021.
//

import Foundation
import Alamofire
//1 способ

extension Data {
    var prettyJSON: NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options:[]),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else {
                  return nil}
                  return prettyPrintedString
              }
    }
struct Friend {
    var id: Int = 0
    var firstName: String?
    var lastName: String?
    var photo100: String?
    
    var fullName: String?{
        (firstName ?? "") + (lastName ?? "")
    }
    
    init(item: [String: Any]){
        self.id = item["id"] as! Int
        self.firstName = item["first_name"] as? String
        self.lastName = item["last_name"] as? String
        self.photo100 = item["photo_100"] as? String
        
    }
       
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
            
            guard let data = response.data else {return}
            
            
            debugPrint(response.data?.prettyJSON)
            
            do {
                let jsonCotainer:Any = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                let object = jsonCotainer as! [String: Any]
                
                let response = object["response"] as! [String: Any]
                
                let items = response["items"] as! [Any]
                
//                var friends: [Friend] = []
//                for item in items{
//                    let friend = Friend(item: item as! [String: Any])
//                    friends.append(friend)
//                }
                let friends = items.map{ Friend(item:$0 as! [String:Any] )}
                
                completion(friends)
            } catch {
                print(error)
            }
        }
    }
}
