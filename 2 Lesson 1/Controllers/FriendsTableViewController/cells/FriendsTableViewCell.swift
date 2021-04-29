//
//  FriendsTableViewCell.swift
//  2 Lesson 1
//
//  Created by Air on 21.04.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBInspectable weak var twoImageView: UIImageView!
    @IBOutlet weak var LabelUp: UILabel!
    @IBOutlet weak var LabelDown: UILabel!
    @IBOutlet weak var myBlackView: UIView!
    
    @IBInspectable var shadowOpacity: Float = 0.9
    @IBInspectable var shadowColor: UIColor = UIColor.black //.cgColor
    @IBInspectable var shadowRadius: CGFloat = 10
    
    var saveUser: User?
    var saveGroup: Group?
    
    func clearCell() {
        twoImageView.image = nil
        LabelDown.text = nil
        LabelUp.text = nil
        saveUser = nil
        saveGroup = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        myBlackView.layer.cornerRadius = myBlackView.frame.size.width / 2
        myBlackView.layer.shadowColor = shadowColor.cgColor
        myBlackView.layer.shadowOffset = CGSize.zero
        myBlackView.layer.shadowRadius = shadowRadius
        myBlackView.layer.shadowOpacity = shadowOpacity
        twoImageView.layer.cornerRadius = twoImageView.frame.size.width / 2
    }
    
    override func prepareForReuse() {
        clearCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWithUser(user: User) {
        LabelUp.text = user.name
        
        if let age = user.age {
            LabelDown
                .text = String(age) + " лет"
        }
        
        if let image = user.avatar {
            twoImageView.image = image
        }

        saveUser = user
        
    }
    
    func configureWithGroup(group: Group) {
        LabelUp.text = group.name
        
        if let description = group.description {
            LabelDown.text = description
        }
        
        if let image = group.groupImage {
            twoImageView.image = image
        }
        saveGroup = group
        
    }
    
}
