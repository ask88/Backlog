//
//  HomeViewController.swift
//  Backlog_UIKit
//
//  Created by Aaron Kiser on 2/10/21.
//

import Foundation
import Firebase
import UIKit

class MainViewController: UIViewController {
    
    var user: UserModel?
    
    var homeCell: HomeCell?
    var searchCell: SearchCell?
    var collectionCell: CollectionCell?
    var backlogCell: BacklogCell?
    
    let navigationBarView = NavigationBarView()
    let sideMenuLauncher = SideMenuLauncher()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = false
        
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.identifier)
        collectionView.register(BacklogCell.self, forCellWithReuseIdentifier: BacklogCell.identifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init(user: UserModel) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("I dislike storyboards")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        view.addSubview(containerView)
        view.addSubview(sideMenuLauncher.popinMenuView.view)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupContainerView()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        //view.addGestureRecognizer(tap)
        
        homeCell  = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: IndexPath(row: 0, section: 0)) as? HomeCell
        searchCell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.identifier, for: IndexPath(row: 1, section: 0)) as? SearchCell
        collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.identifier, for: IndexPath(row: 2, section: 0)) as? CollectionCell
        backlogCell = collectionView.dequeueReusableCell(withReuseIdentifier: BacklogCell.identifier, for: IndexPath(row: 3, section: 0)) as? BacklogCell
        
        //popinMenuView.logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        
        display(contentController: HomeViewController(), on: homeCell!.contentView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationBarView.homeButton.addTarget(self, action: #selector(home), for: .touchUpInside)
        navigationBarView.searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        navigationBarView.collectionButton.addTarget(self, action: #selector(collection), for: .touchUpInside)
        navigationBarView.backlogButton.addTarget(self, action: #selector(backlog), for: .touchUpInside)
    }
    
    func setupContainerView() {
        containerView.addSubview(collectionView)
        containerView.addSubview(navigationBarView.view)
        containerView.addSubview(sideMenuLauncher.blackView)
        
        setupCollectionView()
        navigationBarView.setupView()
        setupNavigationBarView()
        
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        }
    
    func setupCollectionView() {
        collectionView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: navigationBarView.view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
    
    func setupNavigationBarView() {
        navigationBarView.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        navigationBarView.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        navigationBarView.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        navigationBarView.view.heightAnchor.constraint(equalToConstant: navigationBarView.view.frame.height).isActive = true
    }
    
    @objc func home() {
        hideContentController(content: self.children[0])
        display(contentController: HomeViewController(), on: homeCell!.contentView)
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .right, animated: false)
    }
    
    @objc func search() {
        hideContentController(content: self.children[0])
        display(contentController: SearchViewController(), on: searchCell!.contentView)
        collectionView.scrollToItem(at: IndexPath(row: 1, section: 0), at: .right, animated: false)
    }
    
    @objc func backlog() {
        hideContentController(content: self.children[0])
        display(contentController: BacklogViewController(), on: backlogCell!.contentView)
        collectionView.scrollToItem(at: IndexPath(row: 2, section: 0), at: .right, animated: false)
    }
    
    @objc func collection() {
        hideContentController(content: self.children[0])
        display(contentController: CollectionViewController(), on: collectionCell!.contentView)
        collectionView.scrollToItem(at: IndexPath(row: 3, section: 0), at: .right, animated: false)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        sideMenuLauncher.launchSideMenu()
        view.layoutIfNeeded()
    }
    
    @objc func logout() {
        print("Logout")
        let firebaseAuth = Auth.auth()
        do {
            for child in self.children {
                hideContentController(content: child)
            }
            try firebaseAuth.signOut()
            self.dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
    func display(contentController content: UIViewController, on view: UIView) {
        self.addChild(content)
        content.view.frame = view.bounds
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
    
    func hideContentController(content: UIViewController) {
        if self.children.count == 1 {
            content.willMove(toParent: nil)
            content.view.removeFromSuperview()
            content.removeFromParent()
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            return homeCell!
        case 1:
            return searchCell!
        case 2:
            return backlogCell!
        default:
            return collectionCell!
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
