//
//  PopinMenu.swift
//  Backlog_UIKit
//
//  Created by Aaron Kiser on 2/12/21.
//

import Foundation
import UIKit

class PopinMenuView {
    var isDisplayed: Bool = false
    var user: UserModel?
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 50)
        
        let label = UILabel()
        label.text = "Logout"
        label.textAlignment = .center
        button.addSubview(label)
        
        label.topAnchor.constraint(equalTo: button.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupView() {
        view.addSubview(label)
        view.addSubview(logoutButton)
        setupLabel()
        setupLogoutButton()
    }
    
    private func setupLabel() {
        label.text = user?.email
        label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupLogoutButton() {
        logoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: logoutButton.frame.height).isActive = true
    }
}
