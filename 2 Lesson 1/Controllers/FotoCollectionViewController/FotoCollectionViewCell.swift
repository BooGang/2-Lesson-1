//
//  FotoCollectionViewCell.swift
//  weatherG3
//
//  Created by Rodion Molchanov on 14.04.2021.
//

import UIKit

class FotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var LikeLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var fotoImage: UIImageView!
    var isLiked = false
    var savedImage: UIImage?
    
    func clearCell() {
        fotoImage.image = nil
        savedImage = nil
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
    }
    
    
    override func prepareForReuse() { 
        clearCell()
    }
    
    func configure(image: UIImage) {
        fotoImage.image = image
        savedImage = image
    
    }
    
    
    @IBAction func pressLikeButton(_ sender: Any) {
        if isLiked {
            LikeLabel.text = "1"
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = UIColor.systemRed
        } else {
            LikeLabel.text = "0"
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = UIColor.black
        }
        isLiked = !isLiked
    }
    
}
