//
//  TabBarController.swift
//  2 Lesson 1
//
//  Created by Air on 20.04.2021.
//

import UIKit

class TabBarController: UITabBarController {
    func fillUsersArray() {
        
        //        let user1FotoArray = [UIImage(named: "owl")!, UIImage(named: "petr")!]
        //        let user1 = User(name: "petr", age: 19, avatar: nil, fotoArray: user1FotoArray)
        //
        //        DataStorage.shared.usersArray.append(user1)
        
        
        
        let user1 = setNewUser(userNumber: 1, name: "Steve Jobs", age: 56)
        let user2 = setNewUser(userNumber: 2, name: "MF DOOM", age: 49)
        let user3 = setNewUser(userNumber: 3, name: "Eazy-E", age: 31)
        let user4 = setNewUser(userNumber: 4, name: "Eminem", age: 48)
        let user5 = setNewUser(userNumber: 5, name: "Haskies", age: 28)
        let user6 = setNewUser(userNumber: 6, name: "The Notorious B.I.G.", age: 24)
        
        let userArray = [user1, user2, user3, user4, user5, user6]
        
        let group1 = Group(name: "Apple", description: "Apple Developers", groupImage: UIImage(named: "apple"))
        let group2 = Group(name: "M1", description: "Features M1", groupImage: UIImage(named: "m1"))
        let group3 = Group(name: "Swift", description: "Swift for junior", groupImage: UIImage(named: "swift"))
        let group4 = Group(name: "AirTag", description: "Features AirTag", groupImage: UIImage(named: "airtag"))
        
        let groupArray = [group1, group2, group3, group4]
        
        
        DataStorage.shared.usersArray = userArray
        DataStorage.shared.allGroup = groupArray 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillUsersArray()
        // Do any additional setup after loading the view.
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
