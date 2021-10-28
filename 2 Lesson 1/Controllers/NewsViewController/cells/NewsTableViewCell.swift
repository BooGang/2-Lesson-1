//
//  NewsTableViewCell.swift
//  2 Lesson 1
//
//  Created by Богдан Олещенко on 29.08.2021.
//

import UIKit

protocol NewsTableViewCellDelegate: AnyObject {
    func newsTableViewCellDidTapLike(_ cell: NewsTableViewCell)
}
class NewsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "NewsTableViewCell"
    
    weak var delegate: NewsTableViewCellDelegate?

        // MARK: - IBOutlets
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var newsLabel: UILabel!
    
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var commLabel: UILabel!
    
    @IBOutlet weak var commButton: UIButton!
    
    @IBOutlet weak var eyeLabel: UILabel!
    
    @IBOutlet weak var eyeButton: UIButton!
    
    @IBOutlet weak var repostButton: UIButton!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImage.layer.cornerRadius = 26.0
    }

    
    func configureCell(with model: Post) {
        if let avatar = model.avatar {
            avatarImage.image = avatar
        }
        
        nameLabel.text = model.name
        dataLabel.text = model.data
        newsLabel.text = model.news 
        
        if let image = model.image {
            newsImage.image = image
        }
        
        likeLabel.text = "\(model.likeCount)"
        commLabel.text = "\(model.commCount)"
        eyeLabel.text = "\(model.eyeCount)" 
    }
    
    @IBAction func likeButtonTapped(_sender: UIButton) {
        delegate?.newsTableViewCellDidTapLike(self)
    }
    
}
