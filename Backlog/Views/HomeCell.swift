//
//  HomeCell.swift
//  Backlog_UIKit
//
//  Created by Aaron Kiser on 2/19/21.
//

import Foundation
import UIKit

class HomeCell: UICollectionViewCell {
    static let identifier: String = "HomeCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("blah blah")
    }
}
