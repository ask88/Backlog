//
//  CollectionNavigationController.swift
//  Backlog_UIKit
//
//  Created by Aaron Kiser on 2/19/21.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController {
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = false
        collectionView.register(QueriedSearchCell.self, forCellWithReuseIdentifier: QueriedSearchCell.identifier)
        collectionView.backgroundColor = .systemBlue
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Collection"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .green
        view.addSubview(collectionView)
        view.addSubview(label)
        setupCollectionView()
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        super.viewDidLoad()
    }
    
    func setupCollectionView() {
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let queriedSearchcell = collectionView.dequeueReusableCell(withReuseIdentifier: QueriedSearchCell.identifier, for: indexPath) as! QueriedSearchCell
        queriedSearchcell.label.text = "Collection!"
        return queriedSearchcell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

