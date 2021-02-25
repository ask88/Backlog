//
//  HomeViewController.swift
//  Backlog_UIKit
//
//  Created by Aaron Kiser on 2/19/21.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    let label: UILabel = {
        let label = UILabel()
        label.text = "Home"
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
        view.backgroundColor = .red
        view.addSubview(label)
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        super.viewDidLoad()
    }
}
