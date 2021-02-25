//
//  QueriedSearchCell.swift
//  Backlog_UIKit
//
//  Created by Aaron Kiser on 2/23/21.
//

import Foundation
import UIKit

class QueriedSearchCell: UICollectionViewCell {
    static let identifier: String = "QueriedSearchCell"
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .white
        contentView.addSubview(label)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("blah blah")
    }
    
    func setupLabel() {
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}
