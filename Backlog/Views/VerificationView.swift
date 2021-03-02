//
//  VerificationView.swift
//  Backlog
//
//  Created by Aaron Kiser on 2/27/21.
//

import Foundation
import UIKit

class VerificationView {
    let mainView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        view.center.x = UIScreen.main.bounds.maxX / 2
        view.center.y = UIScreen.main.bounds.minY - 50
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(cgColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0.5))
        view.alpha = 0
        return view
    }()
    
    private let verifiedText: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupView() {
        mainView.addSubview(verifiedText)
        
        verifiedText.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        verifiedText.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10).isActive = true
        verifiedText.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
    }
    
    func setVerifiedText(addTo text: String) {
        verifiedText.text = "Added to \(text)"
    }
}
