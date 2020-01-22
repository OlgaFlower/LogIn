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
    @IBOutlet weak var showHidePassButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //transparent navbar
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.isTranslucent = true
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        passwordTextField.isHidden = true
        showHidePassButton.isHidden = true
        loginButton.isHidden = true
        
        //textfield padding
        emailTextField.setLeftPaddingPoints(8)
        emailTextField.setRightPaddingPoints(8)
        passwordTextField.setLeftPaddingPoints(8)
        passwordTextField.setRightPaddingPoints(8)
         
        passwordTextField.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(_:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        //add observers for keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    //MARK: - Handle soft keyboard
    
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
            self.view.frame.origin.y -= (keyboardFrame.height - 100)
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
        let minLength = 5
        var passValid = false
        var emailValid = false
        
        if emailTextField.text!.count >= minLength {
            if Validation.emailValidator(emailTextField.text!) == true {
                emailValid = true
                UITextView.animate(withDuration: 0.5) {
                    self.passwordTextField.isHidden = false
                    self.showHidePassButton.isHidden = false
                }
            }
        }
        
        if passwordTextField.text!.count >= minLength {
            if Validation.passValidator(passwordTextField.text!) == true {
                passValid = true
                
            }
        }
        
        if passValid == true, emailValid == true {
            UITextView.animate(withDuration: 0.5) {
                self.loginButton.isHidden = false
            }
        }
    }
    
    
    
    //MARK: - Actions
    
    @IBAction func logInButton(_ sender: Any) { }
    @IBAction func joinCommunityButton(_ sender: Any) { }
    @IBAction func showHideButton(_ sender: Any) { }
    
}

//MARK: - Handle Done/Return button
extension LoginViewController: UITextFieldDelegate {
    //hide keyboard by click on "done"/"return" button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


//MARK: - Textfield padding
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
