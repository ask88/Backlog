//
//  SearchNavigationController.swift
//  Backlog_UIKit
//
//  Created by Aaron Kiser on 2/19/21.
//

import Foundation
import Firebase
import UIKit

class SearchViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    var masterGameList: [GameModel] = []
    var queriedGameList: [GameModel] = []
    let searchField: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let textField = UITextField()
        textField.placeholder = "Search"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(imageView)
        containerView.addSubview(textField)
        
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageView.frame.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageView.frame.height).isActive = true
        
        textField.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        return containerView
    }()
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .systemGray5
        collectionView.register(QueriedSearchCell.self, forCellWithReuseIdentifier: QueriedSearchCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        view.addSubview(searchField)
        view.addSubview(collectionView)
        setupSearchField()
        setupCollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let textField = searchField.subviews[1] as! UITextField
        textField.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        //self.view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupSearchField() {
        searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    }
    
    func setupCollectionView() {
        collectionView.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func getGames() {
        db.collection("Master List").getDocuments() { (snapshot, err) in
            if let err = err {
                print("ERROR: \(err)")
            } else {
                for document in snapshot!.documents {
                    let id = document.data()["id"] as! String
                    let title = document.data()["title"] as! String
                    let subtitle = document.data()["subtitle"] as! String
                    let game = GameModel(id: id, title: title, subtitle: subtitle)
                    self.masterGameList.append(game)
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let textField = searchField.subviews[1] as! UITextField
        textField.resignFirstResponder()
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        getGames()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        masterGameList.removeAll()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        queriedGameList.removeAll()
        for game in masterGameList {
            if textField.text! == "~Show: All" {
                queriedGameList.append(game)
            }
            
            let title = game.title + " " + game.subtitle
            
            if title.contains(textField.text!) {
                queriedGameList.append(game)
            } else {
                if queriedGameList.count > 0 {
                }
            }
        }
        collectionView.reloadData()
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return queriedGameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let queriedSearchcell = collectionView.dequeueReusableCell(withReuseIdentifier: QueriedSearchCell.identifier, for: indexPath) as! QueriedSearchCell
        queriedSearchcell.label.text = "\(queriedGameList[indexPath.row].title) \(queriedGameList[indexPath.row].subtitle)"
        return queriedSearchcell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
