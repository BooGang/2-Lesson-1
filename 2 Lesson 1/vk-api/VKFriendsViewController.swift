//
//  VKFriendsViewController.swift
//  2 Lesson 1
//
//  Created by Богдан Олещенко on 28.10.2021.
//

import UIKit

class VKFriendsViewController: UITableViewController {
    let friendsService = FriendsAPI()
    let groupsService = GroupsAPI()
    let photosService = PhotosAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsService.getFriends{ friends in
            print("Получили друзей:")
        }
        
        groupsService.getGroups{ groups in
            print("Получили групп:")
        }
        
        photosService.getPhotos{ photos in
            print("Полученные фото:")
            
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


   

}
