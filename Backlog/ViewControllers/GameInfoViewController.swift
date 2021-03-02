//
//  GameInfoViewController.swift
//  Backlog
//
//  Created by Aaron Kiser on 3/1/21.
//

import Foundation
import UIKit

class GameInfoViewController: UIViewController {
    
    let likeDislikeView = LikeDislikeView()
    
    var gameDetails: GameModel
    
    init(gameDetails: GameModel) {
        self.gameDetails = gameDetails
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(likeDislikeView.containerBar)
        likeDislikeView.setupView()
        setupLikeDislikeView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupLikeDislikeView() {
        likeDislikeView.containerBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        likeDislikeView.containerBar.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
