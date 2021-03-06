//
//  LikeDislikeView.swift
//  Backlog
//
//  Created by Aaron Kiser on 3/1/21.
//

import Foundation
import UIKit

class LikeDislikeView {
    
    var likeBarWidthConstraint: NSLayoutConstraint?
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let containerBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 10)
        view.layer.cornerRadius = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let likeBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        //button.backgroundColor = .green
        button.setTitle("Like", for: .normal)
        button.contentHorizontalAlignment = .center
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(likePressed(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var dislikeButton: UIButton = {
        let button = UIButton()
        //button.backgroundColor = .blue
        button.setTitle("Dislike", for: .normal)
        button.contentHorizontalAlignment = .center
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(dislikePressed(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let likeLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dislikeLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var liked: CGFloat
    var disliked: CGFloat
    
    init(liked: CGFloat,
         disliked: CGFloat) {
        
        self.liked = liked
        self.disliked = disliked
        
    }
    
    func setupView() {
        view.addSubview(containerBar)
        containerBar.addSubview(likeBar)
        
        view.addSubview(likeButton)
        view.addSubview(likeLabel)
        view.addSubview(dislikeButton)
        view.addSubview(dislikeLabel)
        
        setLikeNumber()
        setDisikeNumber()
        
        setupLikeBar()
        setupLikeButton()
        setupLikeLabel()
        setupDislikeButton()
        setupDislikeLabel()
        
        containerBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerBar.widthAnchor.constraint(equalToConstant: containerBar.frame.width).isActive = true
        containerBar.heightAnchor.constraint(equalToConstant: containerBar.frame.height).isActive = true
    }
    
    private func setupLikeBar() {
        likeBar.topAnchor.constraint(equalTo: containerBar.topAnchor).isActive = true
        likeBar.leadingAnchor.constraint(equalTo: containerBar.leadingAnchor).isActive = true
        likeBar.heightAnchor.constraint(equalTo: containerBar.heightAnchor).isActive = true
        
        likeBarWidthConstraint = likeBar.widthAnchor.constraint(equalToConstant: getConstant())
        likeBarWidthConstraint?.isActive = true
    }
    
    private func setupLikeButton() {
        likeButton.topAnchor.constraint(equalTo: containerBar.bottomAnchor).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        likeButton.trailingAnchor.constraint(equalTo: likeLabel.leadingAnchor).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    private func setupLikeLabel() {
        likeLabel.topAnchor.constraint(equalTo: containerBar.bottomAnchor).isActive = true
        likeLabel.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor).isActive = true
        likeLabel.trailingAnchor.constraint(equalTo: dislikeButton.leadingAnchor).isActive = true
        likeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        likeLabel.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    private func setupDislikeButton() {
        dislikeButton.topAnchor.constraint(equalTo: containerBar.bottomAnchor).isActive = true
        dislikeButton.leadingAnchor.constraint(equalTo: likeLabel.trailingAnchor).isActive = true
        dislikeButton.trailingAnchor.constraint(equalTo: dislikeLabel.leadingAnchor).isActive = true
        dislikeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dislikeButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    private func setupDislikeLabel() {
        dislikeLabel.topAnchor.constraint(equalTo: containerBar.bottomAnchor).isActive = true
        dislikeLabel.leadingAnchor.constraint(equalTo: dislikeButton.trailingAnchor).isActive = true
        dislikeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dislikeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dislikeLabel.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    @objc func likePressed(_ sender: UIButton?) {
        liked += 1
        setLikeNumber()
        calculateWidth()
    }
    
    @objc func dislikePressed(_ sender: UIButton?) {
        disliked += 1
        setDisikeNumber()
        calculateWidth()
    }
    
    func getTotal() -> CGFloat {
        return liked + disliked
    }
    
    func getAvg() ->  CGFloat {
        if getTotal() > 0 {
            return liked / getTotal()
        } else {
            return 0
        }
    }
    
    func getConstant() -> CGFloat {
        return containerBar.frame.width * getAvg()
    }
    
    func calculateWidth() {
        likeBarWidthConstraint?.constant = getConstant()
    }
    
    func setLikeNumber() {
        likeLabel.text = String(format: "%.0f", liked)
    }
    
    func setDisikeNumber() {
        dislikeLabel.text = String(format: "%.0f", disliked)
    }
}
