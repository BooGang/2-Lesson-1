//
//  AllGroupController.swift
//  2 Lesson 1
//
//  Created by Air on 21.04.2021.
//

import UIKit

class AllGroupController: UITableViewController, UISearchBarDelegate {
    
    var filterGroups: [Group] = []
    var isSearching: Bool = false
    
    @IBOutlet weak var SearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: FriendsTableViewCell.identifier)
        SearchBar.delegate = self
    }
//MARK - searchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearching = (searchText.first != nil)
        
        filter(groups: DataStorage.shared.allGroup, searchText: searchText)
    }
    
    func filter(groups: [Group], searchText: String) {
        filterGroups = DataStorage.shared.allGroup.filter {$0.name.contains(searchText)}
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if isSearching {
            return filterGroups.count
        } else {
            return DataStorage.shared.allGroup.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier, for: indexPath) as? FriendsTableViewCell else {return UITableViewCell()}
        
        if isSearching {
            cell.configureWithGroup(group: filterGroups[indexPath.row])
        } else {
            cell.configureWithGroup(group: DataStorage.shared.allGroup[indexPath.row])
        }

        return cell
    }
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? FriendsTableViewCell,
              let group = cell.saveGroup 
        else {return}
        
        
        var isEnableItem = false
        
        for item in DataStorage.shared.myFavoriteGroup {
            if item.name == group.name {
                isEnableItem = true
            }
        }
        
        if !isEnableItem {
            DataStorage.shared.myFavoriteGroup.append(group)
        }
    }
}
