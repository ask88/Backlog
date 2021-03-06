//
//  GameInfoViewController.swift
//  Backlog
//
//  Created by Aaron Kiser on 3/1/21.
//

import Foundation
import UIKit

class GameInfoViewController: UIViewController {
    
    var likeDislikeView: LikeDislikeView?
    
    var gameDetails: GameModel
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    init(gameDetails: GameModel) {
        self.gameDetails = gameDetails
        likeDislikeView = LikeDislikeView(liked: gameDetails.likes, disliked: gameDetails.dislikes)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(likeDislikeView!.view)
        setupLikeDislikeView()
        
        title = gameDetails.title + " " + gameDetails.subtitle
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func setupLikeDislikeView() {
        likeDislikeView!.setupView()
        likeDislikeView!.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        likeDislikeView!.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        likeDislikeView!.view.widthAnchor.constraint(equalToConstant: 200).isActive = true
        likeDislikeView!.view.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
}
