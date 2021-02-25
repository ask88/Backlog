//
//  NavigationBarView.swift
//  Backlog_UIKit
//
//  Created by Aaron Kiser on 2/11/21.
//

import Foundation
import UIKit

class NavigationBarView {
    let view: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let homeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "home"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        button.addSubview(label)
        
        label.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        
        return button
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "search"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        button.addSubview(label)
        
        label.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        
        return button
    }()
    
    let backlogButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "backlog"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        button.addSubview(label)
        
        label.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        
        return button
    }()
    
    let collectionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "collection"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        button.addSubview(label)
        
        label.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        
        return button
    }()
    
    func setupView() {
        view.addSubview(homeButton)
        view.addSubview(searchButton)
        view.addSubview(backlogButton)
        view.addSubview(collectionButton)
        setupButton()
    }
    
    private func setupButton() {
        view.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        
        homeButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backlogButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        homeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        searchButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backlogButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: homeButton.trailingAnchor).isActive = true
        backlogButton.leadingAnchor.constraint(equalTo: searchButton.trailingAnchor).isActive = true
        collectionButton.leadingAnchor.constraint(equalTo: backlogButton.trailingAnchor).isActive = true
        
        homeButton.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: backlogButton.leadingAnchor).isActive =  true
        backlogButton.trailingAnchor.constraint(equalTo: collectionButton.leadingAnchor).isActive = true
        collectionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        homeButton.widthAnchor.constraint(equalToConstant: view.frame.width/4).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: view.frame.width/4).isActive = true
        backlogButton.widthAnchor.constraint(equalToConstant: view.frame.width/4).isActive = true
        collectionButton.widthAnchor.constraint(equalToConstant: view.frame.width/4).isActive = true
    }
}
