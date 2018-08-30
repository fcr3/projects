//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        //TODO: Set up a new user on our Firbase database
        
        SVProgressHUD.show()
        
        if let email = emailTextfield.text, let pass = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                if let err = error {
                    SVProgressHUD.showError(withStatus: "Could Not Register")
                    print(err)
                } else {
                    SVProgressHUD.showSuccess(withStatus: "Registered")
                    self.performSegue(withIdentifier: "goToChat", sender: self)
                }
            }
        }
    } 
    
    
}