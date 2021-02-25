//
//  SearchCell.swift
//  Backlog_UIKit
//
//  Created by Aaron Kiser on 2/20/21.
//

import Foundation
import UIKit

class SearchCell: UICollectionViewCell {
    static let identifier: String = "SearchCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("blah blah")
    }
}
