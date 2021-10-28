//
//  NewsViewController.swift
//  2 Lesson 1
//
//  Created by Богдан Олещенко on 29.08.2021.
//

import UIKit

class NewsViewController: UIViewController {

    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let posts: [Post] = [
        Post(avatar: UIImage(named: "avatarMasha"), name: "Masha Khen", data: "12.12.12", news: "News for today", image: UIImage(named: "masha"), likeCount: 12, commCount: 12, eyeCount: 12),
        Post(avatar: UIImage(named: "avatarBogdan"), name: "Bogdan Oleshchenko", data: "13.13.13", news: "Have a good day!", image: UIImage(named: "bogdan"), likeCount: 13, commCount: 13, eyeCount: 13)
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: NewsTableViewCell.reuseIdentifier)
        tableView.tableFooterView = UIView()
    }
}

// MARK: - DataSource
extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseIdentifier, for: indexPath) as! NewsTableViewCell
        cell.configureCell(with: posts[indexPath.row])
        cell.delegate = self
        return cell
    }
}

// MARK: - UITableViewDelegate
extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


// MARK: - NewsTableViewCellDelegate
extension NewsViewController: NewsTableViewCellDelegate {
    
    func newsTableViewCellDidTapLike(_ cell: NewsTableViewCell) {
        
    }
}

