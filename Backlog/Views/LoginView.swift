//
//  LoginView.swift
//  Backlog_UIKit
//
//  Created by Aaron Kiser on 2/6/21.
//

import Foundation
import UIKit

class LoginView {
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let segmentedSelector: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Login", "Register"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .systemGray6
        segmentedControl.tintColor = .systemGray3
        segmentedControl.frame = CGRect(x: 0, y: 0, width: 0, height: 50)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    let usernameTextFieldContainerView: UIView = {
        let container = UIView()
        container.backgroundColor = .systemGray5
        container.frame = CGRect(x: 0, y: 0, width: 0, height: 50)
        
        let textField = UITextField()
        textField.placeholder = "Enter Username:"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(textField)
        textField.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10).isActive = true
        
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let emailTextFieldContainerView: UIView = {
        let container = UIView()
        container.backgroundColor = .systemGray5
        container.frame = CGRect(x: 0, y: 0, width: 0, height: 50)
        
        let textField = UITextField()
        textField.placeholder = "Enter Email:"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(textField)
        textField.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10).isActive = true
        
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let passwordTextFieldContainerView: UIView = {
        let container = UIView()
        container.backgroundColor = .systemGray5
        container.frame = CGRect(x: 0, y: 0, width: 0, height: 50)
        
        let textField = UITextField()
        textField.placeholder = "Enter Password:"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 0)
        button.setTitle("Show", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(textField)
        container.addSubview(button)
        
        textField.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        
        button.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: textField.trailingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10).isActive = true
        button.widthAnchor.constraint(equalToConstant: button.frame.width).isActive = true
        
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let confirmPasswordTextFieldContainerView: UIView = {
        let container = UIView()
        container.backgroundColor = .systemGray5
        container.frame = CGRect(x: 0, y: 0, width: 0, height: 50)
        
        let textField = UITextField()
        textField.placeholder = "Confirm Password:"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(textField)
        
        textField.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let loginRegisterButtonContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .systemGray5
        container.frame = CGRect(x: 0, y: 0, width: 0, height: 50)
        
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(button)
        
        button.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    func setupView() {
        view.addSubview(segmentedSelector)
        view.addSubview(usernameTextFieldContainerView)
        view.addSubview(emailTextFieldContainerView)
        view.addSubview(passwordTextFieldContainerView)
        view.addSubview(confirmPasswordTextFieldContainerView)
        view.addSubview(loginRegisterButtonContainer)
        
        setupSegmentedSelctor()
        setupUsernameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupConfirmPasswordTextField()
        setupLoginRegisterButtonContainer()
    }
    
    private func setupSegmentedSelctor() {
        segmentedSelector.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        segmentedSelector.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        segmentedSelector.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        segmentedSelector.heightAnchor.constraint(equalToConstant: segmentedSelector.frame.height).isActive = true
    }
    
    private func setupUsernameTextField() {
        usernameTextFieldContainerView.topAnchor.constraint(equalTo: segmentedSelector.bottomAnchor, constant: 10).isActive = true
        usernameTextFieldContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        usernameTextFieldContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        usernameTextFieldContainerView.heightAnchor.constraint(equalToConstant: usernameTextFieldContainerView.frame.height).isActive = true
    }
    
    private func setupEmailTextField() {
        emailTextFieldContainerView.topAnchor.constraint(equalTo: usernameTextFieldContainerView.bottomAnchor).isActive = true
        emailTextFieldContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        emailTextFieldContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        emailTextFieldContainerView.heightAnchor.constraint(equalToConstant: emailTextFieldContainerView.frame.height).isActive = true
    }
    
    private func setupPasswordTextField() {
        passwordTextFieldContainerView.topAnchor.constraint(equalTo: emailTextFieldContainerView.bottomAnchor).isActive = true
        passwordTextFieldContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        passwordTextFieldContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        passwordTextFieldContainerView.heightAnchor.constraint(equalToConstant: passwordTextFieldContainerView.frame.height).isActive = true
    }
    
    private func setupConfirmPasswordTextField() {
        confirmPasswordTextFieldContainerView.topAnchor.constraint(equalTo: passwordTextFieldContainerView.bottomAnchor).isActive = true
        confirmPasswordTextFieldContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        confirmPasswordTextFieldContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        confirmPasswordTextFieldContainerView.heightAnchor.constraint(equalToConstant: confirmPasswordTextFieldContainerView.frame.height).isActive = true
    }
    
    private func setupLoginRegisterButtonContainer() {
        loginRegisterButtonContainer.topAnchor.constraint(equalTo: confirmPasswordTextFieldContainerView.bottomAnchor).isActive = true
        loginRegisterButtonContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loginRegisterButtonContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        loginRegisterButtonContainer.heightAnchor.constraint(equalToConstant: loginRegisterButtonContainer.frame.height).isActive = true
    }
    
    func setSecureField(secure: Bool) {
        let textField = passwordTextFieldContainerView.subviews[0] as! UITextField
        let confirmTextField = confirmPasswordTextFieldContainerView.subviews[0] as! UITextField
        textField.isSecureTextEntry = secure
        confirmTextField.isSecureTextEntry = secure
    }
}
