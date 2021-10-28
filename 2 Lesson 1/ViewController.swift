//
//  ViewController.swift
//  2 Lesson 1
//
//  Created by Air on 03.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var MyButton: UIButton!
    @IBOutlet weak var Mylabel: UILabel!
    @IBOutlet weak var MyTextEditor: UITextField!
    
    let fromLoginToTabBar = "fromLoginToTabBar"
    
    
    
    func showAlert(alertText: String) {
        let alertController = UIAlertController(title: "Error", message: alertText, preferredStyle: UIAlertController.Style.alert)
        let actionButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: {_ in
            self.MyTextEditor.text = ""
            self.TextField.text = ""
        })
        alertController.addAction(actionButton)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func pressButton(_ sender: Any) {
        
        //        self.MyTextEditor.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        //        self.TextField.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        //        guard let login = self.MyTextEditor.text,
        //              let password = self.TextField.text,
        //              login.trimmingCharacters(in: .whitespacesAndNewlines) == "admin",
        //              password.trimmingCharacters(in: .whitespacesAndNewlines) == "1234567890"
        //        else {
        //            self.showAlert(alertText: "Incorrect login or password")
        //            self.MyTextEditor.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        //            self.TextField.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        //        return
        //
        //
        //        }
        performSegue(withIdentifier: self.fromLoginToTabBar, sender: self)
    }
}



