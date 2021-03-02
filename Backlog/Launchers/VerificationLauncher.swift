//
//  SideLoadedMenuLauncher.swift
//  Backlog
//
//  Created by Aaron Kiser on 2/28/21.
//

import Foundation
import UIKit

class VerificationLauncher: NSObject {
    
    let verificationView = VerificationView()
    
    override init() {
        super.init()
        verificationView.setupView()
    }
    
    func launchMenu() {
        self.verificationView.mainView.alpha = 1
        UIView.animate(withDuration: 0.5) {
            self.verificationView.setVerifiedText(addTo: "Backlog")
            self.verificationView.mainView.center.y = UIScreen.main.bounds.minY + 50
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.0) {
                self.verificationView.mainView.center.y = UIScreen.main.bounds.minY - 50
                self.verificationView.mainView.alpha = 1
            } completion: { _ in
                self.verificationView.mainView.alpha = 0
            }
        }
    }
}
