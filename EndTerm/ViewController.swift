//
//  ViewController.swift
//  EndTerm
//
//  Created by Manish Dua on 2019-12-04.
//  Copyright © 2019 Manish Dua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var validation = Validation()
    @IBOutlet weak var lblValidationMessage: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblValidationMessage.isHidden = true
        // Do any additional setup after loading the view.
    }


    @IBAction func signUp(_ sender: UIButton) {
        performSegue(withIdentifier: "Registeration", sender: sender)
    }
 
    
    @IBAction func btnClickValidate(_ sender: Any) {
        
        guard let email = emailField.text, let password = passwordField.text
                 else {
                return
             }
           
          let isValidateEmail = self.validation.validateEmailId(emailID: email)
             if (isValidateEmail == false) {
               let alert = UIAlertController(title: "Invalid email", message: "Please enter correct email", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
                return
             }
             let isValidatePass = self.validation.validatePassword(password: password)
             if (isValidatePass == false) {
                     let alert = UIAlertController(title: "Invalid Password", message: "Please enter correct password", preferredStyle: .alert)
                          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                           self.present(alert, animated: true)
                return
             }
        performSegue(withIdentifier: "Registeration", sender: sender)
           
        
    }

    
   
}
    


