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
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //transparent navbar
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.isTranslucent = true
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        //add observers for keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
        passwordTextField.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(_:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    //MARK: - handle login keyboard
    
    //hide keyboard by tap out of text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    //show keyboard and scroll view up
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardFrame.height
        }
    }
    
    // hide keyboard and scroll view down
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
   //MARK: - Validation
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        loginButton.isEnabled = false
        let minLength = 5
        var passValid = false
        var emailValid = false
        
        if passwordTextField.text!.count >= minLength {
            if Validation.passValidator(passwordTextField.text!) == true {
                print("valid pass \(passwordTextField.text!)")
                passValid = true
            }
        }
        
        if emailTextField.text!.count >= minLength {
            if Validation.emailValidator(emailTextField.text!) == true {
                print("valid email \(emailTextField.text!)")
                emailValid = true
            }
        }
        
        if passValid == true, emailValid == true {
            loginButton.isEnabled = true
        }
    }
    
    
    

    @IBAction func LoginButton(_ sender: Any) {
        
    }
    
    @IBAction func joinCommunityButton(_ sender: Any) {}
    

}


extension LoginViewController: UITextFieldDelegate {
    //hide keyboard by click on "done"/"return" button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
