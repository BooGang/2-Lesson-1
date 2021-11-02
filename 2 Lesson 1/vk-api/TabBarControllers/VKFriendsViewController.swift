//
//  VKFriendsViewController.swift
//  2 Lesson 1
//
//  Created by Богдан Олещенко on 28.10.2021.
//

import UIKit

class VKFriendsViewController: UITableViewController {
    let friendsService = FriendsAPI()
    var friends:[Friend] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        friendsService.getFriends{ [weak self] friends in
            guard let self = self else {return}
            print("Получили друзей:")
            
            self.friends = friends
            self.tableView.reloadData()
        }
        
        
    }
    
   

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let friend = friends[indexPath.row]
        
        cell.textLabel?.text = friend.fullName
        return cell
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }


}

