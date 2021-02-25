//
//  ViewController.swift
//  Backlog_UIKit
//
//  Created by Aaron Kiser on 2/5/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var secureTextEntryToggle = true
    
    let loginView = LoginView()
    
    var loginRegisterDetails = LoginRegisterModel()
    
    var userNameTextField: UITextField?
    var emailTextField: UITextField?
    var passwordTextField: UITextField?
    var confirmPasswordTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(loginView.view)
        setupLoginView()
        
        userNameTextField = loginView.view.subviews[1].subviews[0] as? UITextField
        emailTextField = loginView.view.subviews[2].subviews[0] as? UITextField
        passwordTextField = loginView.view.subviews[3].subviews[0] as? UITextField
        confirmPasswordTextField = loginView.view.subviews[4].subviews[0] as? UITextField
        
        userNameTextField!.delegate = self
        emailTextField!.delegate = self
        passwordTextField!.delegate = self
        confirmPasswordTextField!.delegate = self
        
        let button = loginView.passwordTextFieldContainerView.subviews[1] as! UIButton
        let submitButton = loginView.loginRegisterButtonContainer.subviews[0] as! UIButton
        
        button.addTarget(self, action: #selector(toggleSecureField(_:)), for: .touchUpInside)
        loginView.segmentedSelector.addTarget(self, action: #selector(toggleLoginRegister(_:)), for: .valueChanged)
        
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loginView.usernameTextFieldContainerView.frame.origin.x = UIScreen.main.bounds.maxX
        self.loginView.confirmPasswordTextFieldContainerView.frame.origin.x = UIScreen.main.bounds.minX - UIScreen.main.bounds.maxX
        self.loginView.emailTextFieldContainerView.frame.origin.y = 110
        self.loginView.passwordTextFieldContainerView.frame.origin.y = 160
        self.loginView.loginRegisterButtonContainer.frame.origin.y = 210
    }
    
    @objc func toggleLoginRegister(_ sender: UISegmentedControl?) {
        let button = loginView.loginRegisterButtonContainer.subviews[0] as! UIButton
        if sender?.selectedSegmentIndex == 0 {
            animateTextFieldsOut()
            button.setTitle("Login", for: .normal)
        } else {
            animateTextFieldsIn()
            button.setTitle("Register", for: .normal)
        }
    }
    
    @objc func toggleSecureField(_ sender: UIButton?) {
        secureTextEntryToggle.toggle()
        
        if secureTextEntryToggle {
            sender?.setTitle("Show", for: .normal)
        } else {
            sender?.setTitle("Hide", for: .normal)
        }
        loginView.setSecureField(secure: secureTextEntryToggle)
    }
    
    func animateTextFieldsOut() {
        UIView.animate(
            withDuration: 0.2,
            animations: {
                self.userNameTextField!.isEnabled = false
                self.emailTextField!.isEnabled = false
                self.passwordTextField!.isEnabled = false
                self.confirmPasswordTextField!.isEnabled = false
                
                self.loginView.usernameTextFieldContainerView.frame.origin.x = UIScreen.main.bounds.maxX
                self.loginView.confirmPasswordTextFieldContainerView.frame.origin.x = UIScreen.main.bounds.minX - UIScreen.main.bounds.maxX
            }) { (completed) in
            UIView.animate(
                withDuration: 0.2,
                animations: {
                    self.loginView.emailTextFieldContainerView.frame.origin.y = 110
                    self.loginView.passwordTextFieldContainerView.frame.origin.y = 160
                    self.loginView.loginRegisterButtonContainer.frame.origin.y = 210
                }
            ) { (completed) in
                self.emailTextField!.isEnabled = true
                self.passwordTextField!.isEnabled = true
            }
        }
    }
    
    func animateTextFieldsIn() {
        UIView.animate(
            withDuration: 0.2,
            animations: {
                self.emailTextField!.isEnabled = false
                self.userNameTextField!.isEnabled = false
                self.passwordTextField!.isEnabled = false
                self.confirmPasswordTextField!.isEnabled = false
                
                self.loginView.emailTextFieldContainerView.frame.origin.y = 160
                self.loginView.passwordTextFieldContainerView.frame.origin.y = 210
                self.loginView.loginRegisterButtonContainer.frame.origin.y = 310
                
            }) { (completed) in
            UIView.animate(
                withDuration: 0.2,
                animations: {
                    
                    self.loginView.usernameTextFieldContainerView.frame.origin.x = 0
                    self.loginView.confirmPasswordTextFieldContainerView.frame.origin.x = 0
                }
            ) { (completed) in
                self.emailTextField!.isEnabled = true
                self.userNameTextField!.isEnabled = true
                self.passwordTextField!.isEnabled = true
                self.confirmPasswordTextField!.isEnabled = true
            }
        }
    }
    
    @objc func submit() {
        if loginView.segmentedSelector.selectedSegmentIndex == 0 {
            login()
        } else {
            register()
        }
    }
    
    @objc func login() {
        Auth.auth().signIn(withEmail: loginRegisterDetails.email == nil ? " " : loginRegisterDetails.email!,
                           password: loginRegisterDetails.password == nil ? " " : loginRegisterDetails.password!)
        { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if error == nil {
                strongSelf.dismiss(animated: true, completion: nil)
            } else {
                print(error as Any)
            }
        }
    }
    
    @objc func register() {
        Auth.auth().createUser(withEmail: loginRegisterDetails.email == nil ? " " : loginRegisterDetails.email!,
                               password: loginRegisterDetails.password == nil ? " " : loginRegisterDetails.password!)
        { authResult, error in
            
        }
    }
    
    func setupLoginView() {
        loginView.setupView()
        loginView.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        loginView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loginView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loginView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        loginRegisterDetails.username = self.userNameTextField!.text
        loginRegisterDetails.email = self.emailTextField!.text
        loginRegisterDetails.password = self.passwordTextField!.text
        loginRegisterDetails.confirmPassword = self.confirmPasswordTextField!.text
    }
}
