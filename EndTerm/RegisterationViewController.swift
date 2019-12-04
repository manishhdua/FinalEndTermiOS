//
//  RegisterationViewController.swift
//  EndTerm
//
//  Created by Manish Dua on 2019-12-04.
//  Copyright © 2019 Manish Dua. All rights reserved.
//

import UIKit
import AVFoundation

class RegisterationViewController: UIViewController {
    var validation = Validation()
  
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPassField: UITextField!
     var profileImg : UIImage!
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var shortBioField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageview.image = profileImg
    }
    
    @IBAction func clickSetPicture(_ sender: Any) {
        performSegue(withIdentifier: "CameraV", sender: sender)
     
    }
   
    
    @IBAction func signUpValidate(_ sender: Any) {
        
        guard let email = emailField.text, let password = passwordField.text, let confirmPass = confirmPassField.text, let username = userName.text, let shortbio = shortBioField.text
                 else {
                return
             }
        if email.isEmpty || password.isEmpty || confirmPass.isEmpty||username.isEmpty || shortbio.isEmpty {
           displayMyAlertMessage(userMessage: "All fields are required");
        }
        
    if((password.elementsEqual(confirmPass)) == false)
       {
         displayMyAlertMessage(userMessage: "Password did not match");
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
        performSegue(withIdentifier: "ProfilePage", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              if (segue.identifier == "ProfilePage") {
                
                  let ProfileController = segue.destination as? ProfileViewController
                ProfileController?.userlable = userName.text
                ProfileController?.bio = shortBioField.text
                ProfileController?.userImage = profileImg

              }
           }
    
    func displayMyAlertMessage(userMessage: String){
         var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert);
         let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
         myAlert.addAction(okAction);
         self.present(myAlert, animated:true, completion: nil);
        
        
    }
    
    

}
