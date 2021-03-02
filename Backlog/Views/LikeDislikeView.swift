//
//  LikeDislikeView.swift
//  Backlog
//
//  Created by Aaron Kiser on 3/1/21.
//

import Foundation
import UIKit

class LikeDislikeView {
    
    private var likeBarWidthConstraint: NSLayoutConstraint?
    
    let likeBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let containerBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Like", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupView() {
        containerBar.addSubview(likeBar)
        containerBar.addSubview(button)
        
        setupLikeBar()
        setupButton()
        
        containerBar.widthAnchor.constraint(equalToConstant: 100).isActive = true
        containerBar.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    
    private func setupLikeBar() {
        likeBar.topAnchor.constraint(equalTo: containerBar.topAnchor).isActive = true
        likeBar.leadingAnchor.constraint(equalTo: containerBar.leadingAnchor).isActive = true
        likeBar.heightAnchor.constraint(equalTo: containerBar.heightAnchor).isActive = true
        likeBarWidthConstraint = likeBar.widthAnchor.constraint(equalToConstant: 10)
        likeBarWidthConstraint?.isActive = true
    }
    
    private func setupButton() {
        button.topAnchor.constraint(equalTo: containerBar.bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: containerBar.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: containerBar.trailingAnchor).isActive = true
    }
}
