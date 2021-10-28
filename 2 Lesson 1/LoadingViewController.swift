//
//  LoadingViewController.swift
//  2 Lesson 1
//
//  Created by Богдан Олещенко on 09.09.2021.
//

import UIKit

class LoadingViewController: UIViewController {
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var LoadingLabel: UILabel!
    @IBOutlet weak var LoadingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateProgressView), userInfo: nil, repeats: true)
        
        progressView.setProgress(0, animated: true)
        LoadingButton.isHidden = true
        LoadingButton.alpha = 0
        
    }
    
    @objc func updateProgressView() {
        if progressView.progress != 1 {
            self.progressView.progress += 0.5
        } else {
            self.LoadingLabel.text = "Completed!"
            performSegue(withIdentifier: "fromLoadingToTabBar", sender: self)
        }
    }
}





