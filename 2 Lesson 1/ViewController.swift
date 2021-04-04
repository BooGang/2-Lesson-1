//
//  ViewController.swift
//  2 Lesson 1
//
//  Created by Air on 03.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MyButton: UIButton!
    
    @IBOutlet weak var Mylabel: UILabel!
    
    @IBOutlet weak var MyTextEditor: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    
        
    }

    @IBAction func pressButton(_ sender: Any) {
        
        self.MyTextEditor.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
    }
    
}

