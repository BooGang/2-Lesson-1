//
//  VKPhotosViewController.swift
//  2 Lesson 1
//
//  Created by Богдан Олещенко on 02.11.2021.
//

import UIKit

class VKPhotosViewController: UIViewController {
    @IBOutlet weak var photoOne: UIImageView!
    @IBOutlet weak var photoTwo: UIImageView!
    @IBOutlet weak var photoTree: UIImageView!
    
    
     let image1 = "https://sun9-19.userapi.com//impg//GMQ4xgWZ-i9v0YROXj00Leffv2777cvfreb3Uw//BD4EG23GRf4.jpg?size=810x1080&quality=96&sign=fc6770ef2670fa573eab068d35463e2a&c_uniq_tag=hv2KU1n3xFUbIhRVoJ6rvEuipQ966rgdQ3nQe3tz6Ac&type=album"
    let image2 = "https://sun9-38.userapi.com/impg/zo9Gj_P8J9ftiS-NADDTKkAPPhKtODEbpfH-4Q/szfP4rqlWwg.jpg?size=933x699&quality=95&sign=4740be13b6902406342a5053b7a60f0a&type=album"
    let image3 = "https://icdn.lenta.ru/images/2021/04/27/16/20210427163138131/detail_9b31eaf4376cdff03e0ba1bcaa826a01.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoOne.load(urlString: image1)
        photoTwo.load(urlString: image2)
        photoTree.load(urlString: image3)
        
        photoOne.layer.cornerRadius = 10
        photoTwo.layer.cornerRadius = 10
        photoTree.layer.cornerRadius = 10
    }
    

    

}

