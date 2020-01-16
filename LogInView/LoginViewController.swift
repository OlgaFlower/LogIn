//
//  LoginViewController.swift
//  LogInView
//
//  Created by Admin on 16.01.2020.
//  Copyright © 2020 Flower. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //transparent navbar
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.isTranslucent = true
        
        //        emailTextField.delegate = self as? UITextFieldDelegate
        //        self.passwordTextField.becomeFirstResponder()
        
        
    }
    
    
    //hide keyboard by tap out of text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    
    @IBAction func LoginButton(_ sender: Any) {
        
    }
    
    @IBAction func joinCommunityButton(_ sender: Any) {
    }
    

}
